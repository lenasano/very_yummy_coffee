import 'dart:async';
import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:feature_management_experimentation_models/fme_models.dart';
import 'package:web_socket_client/web_socket_client.dart';

/// {@template ws_fme_client}
/// A WebSocket-based RPC client that multiplexes multiple topic subscriptions
/// over a single persistent connection.
///
/// Use [subscribe] to receive a stream of updates for a given topic. If a
/// subscription already exists for the topic, the same broadcast stream is
/// returned, so multiple callers in the same application share one connection.
///
/// Use [sendAction] to send an action to the server.
///
/// Use [unsubscribe] when you no longer need updates for a topic. Call [close]
/// to tear down the connection entirely.
/// {@endtemplate}
class WsFmeClient {
  WsFmeClient._({required LiveConnection<Map<String, dynamic>> connection})
    : _connection = connection;

  /// Creates a [WsFmeClient] using an existing [ApiClient] for connection
  /// parameters (host, port, scheme).
  factory WsFmeClient.fromApiClient(ApiClient apiClient) {
    return WsFmeClient._(
      connection: apiClient.startLiveConnection(
        '/fme',
        responseFromJson: (body) => jsonDecode(body) as Map<String, dynamic>,
      ),
    );
  }

  /// Creates a [WsFmeClient] from an existing [LiveConnection].
  ///
  /// Prefer [WsFmeClient.fromApiClient] in production code. This constructor
  /// is intended for use in tests where a pre-configured connection is needed.
  WsFmeClient.fromConnection({
    required LiveConnection<Map<String, dynamic>> connection,
  }) : _connection = connection;

  final LiveConnection<Map<String, dynamic>> _connection;
  final Map<String, StreamController<Map<String, dynamic>>> _controllers = {};
  StreamSubscription<Map<String, dynamic>>? _inboundSub;
  StreamSubscription<ConnectionState>? _connectionSub;

  /// Emits true when the WebSocket is connected or reconnected,
  /// and false when it disconnects.
  Stream<bool> get isConnected => _connection.connection.map(
    (state) => state is Connected || state is Reconnected,
  );

  /// Returns a broadcast stream of update payloads for [topic].
  ///
  /// If already subscribed, returns the existing stream. Otherwise, sends a
  /// subscribe message to the server and creates a new stream.
  Stream<Map<String, dynamic>> subscribe(String topic) {
    if (_controllers.containsKey(topic)) {
      //log('[ws_fme_client] returning existing stream for topic: $topic');
      return _controllers[topic]!.stream;
    }
    _controllers[topic] = StreamController<Map<String, dynamic>>.broadcast();
    _ensureListening();
    _connection.send(RpcSubscribeMessage(topic: topic).toMap());

    //log('[ws_fme_client] returning newly created stream for topic: $topic');
    return _controllers[topic]!.stream;
  }

  /// Sends an unsubscribe message for [topic] and closes its stream.
  void unsubscribe(String topic) {
    _connection.send(RpcUnsubscribeMessage(topic: topic).toMap());
    _controllers.remove(topic)?.close();
  }

  /// Sends a typed action to the server.
  void sendAction(FmeAction action) {
    _connection.send(
      RpcActionClientMessage(
        action: action.actionName,
        payload: action.toPayloadMap(),
      ).toMap(),
    );
  }

  /// Closes the connection and all topic streams.
  void close() {
    _inboundSub?.cancel();
    _connectionSub?.cancel();
    for (final controller in _controllers.values) {
      controller.close();
    }
    _controllers.clear();
    _connection.close();
  }

  void _ensureListening() {
    if (_inboundSub != null) return;

    _inboundSub = _connection.stream.listen((message) {
      if (message['type'] == 'update') {
        final topic = message['topic'] as String?;
        final payload = message['payload'];
        if (topic != null && payload is Map<String, dynamic>) {
          _controllers[topic]?.add(payload);
        }
      }
    });

    _connectionSub = _connection.connection.listen((state) {
      if (state is Reconnected) {
        for (final topic in _controllers.keys) {
          _connection.send(RpcSubscribeMessage(topic: topic).toMap());
        }
      }
    });
  }
}
