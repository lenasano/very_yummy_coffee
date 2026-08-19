import 'dart:async';
import 'dart:convert';
import 'dart:developer';
//import 'fme:io';
import 'package:feature_management_experimentation_models/fme_models.dart';

/// {@template server_state}
/// In-memory server state for the RPC WebSocket layer.
///
/// Holds the current flag definitions and targeting rules, and manages topic
/// (feature flag) subscriptions.
/// A single [fmeState] singleton is shared across all WebSocket connections.
/// {@endtemplate}
class FmeState {
  late Object _fme;// = Object();  // the FME SDK client

  // topic -> set of connected sinks
  final Map<String, Set<StreamSink<dynamic>>> _subs = {};

  /// Loads menu data from the fixture file. Called once at server startup.
  void initialize() {
    _fme = Object(); /* SplitFactory({
      core: {
        authorizationKey: 'YOUR_SDK_KEY'
      }
    }).client; * /

    client.on(
        client.Event.SDK_UPDATE, 
        (metadata: SplitIO.SdkUpdateMetadata) => {
      const type: SplitIO.SdkUpdateMetadataType = metadata.type;
      const names: string[] = metadata.names;
    })

    client.on(client.Event.SDK_READY, (metadata: SplitIO.SdkReadyMetadata) => {
      const initialCacheLoad: boolean = metadata.initialCacheLoad;
      const lastUpdateTimestamp: number |
       undefined = metadata.lastUpdateTimestamp;
      metadata.Type == "FLAGS_UPDATE"
      metadata.Names[] // list of updated flags: for each of these broadcast an update event
    })
    client.on(client.Event.SDK_READY_TIMED_OUT, () => {
          console.log('Split SDK emitted SDK_READY_TIMED_OUT event.')
    }) */
  }

  /// Adds [sink] as a subscriber to [topic].
  void subscribe(String topic, StreamSink<dynamic> sink) {
    log('[fme_state] subscribe $topic');
    _subs.putIfAbsent(topic, () => {}).add(sink);
  }

  /// Removes [sink] from [topic] subscribers.
  void unsubscribe(String topic, StreamSink<dynamic> sink) {
    log('[fme_state] unsubscribe $topic');
    _subs[topic]?.remove(sink);
  }

  /// Removes [sink] from all topic subscriptions (called on disconnect).
  void removeAllSubscriptions(StreamSink<dynamic> sink) {
    log('[fme_state] removeAllSubscriptions');
    for (final sinks in _subs.values) {
      sinks.remove(sink);
    }
  }

  /// Broadcasts [payload] to all subscribers of [topic].
  /// Usage: This can be used to signal a change in a feature flag. The
  /// subscriber can then initiate a getTreatment call for that flag.
  void broadcast(String topic, Map<String, dynamic> payload) {
    log('[fme_state] broadcast $topic: $payload');
    final message = jsonEncode({
      'type': 'update',
      'topic': topic,
      'payload': payload,
    });
    final subscribers = _subs[topic];
    if (subscribers == null || subscribers.isEmpty) return;
    for (final sink in List.of(subscribers)) {
      sink.add(message);
    }
  }

  /// Sends [payload] (e.g. feature flag evaluation info) to [sink].
  void reply(
    String topic, 
    Map<String, dynamic> payload, 
    StreamSink<dynamic> sink) {
    log('[fme_state] reply');
    final message = jsonEncode({
      'type': 'update',
      'topic': topic,
      'payload': payload,
    });
    sink.add(message);
  }

  /// Processes an [action] (like 'getTreatment') with [payload]. Sends the
  /// treatment result back to the sender.
  void handleAction(
    String action, 
    Map<String, dynamic> payload, 
    StreamSink<dynamic> sink
  ) {
    log('[fme_state] handle action');
    switch (action) {

      case 'getTreatment':

        final flagName = payload['flagName'] as String?;
        final userKey =  payload['userKey']  as String?;

        if (null == flagName || null == userKey) return;
        if (/*!FmeFlagName.exists(flagName) || */_fme is String) return;

        var result = userKey; //fme.getTreatment(flagName, userKey);

        if ('coupon_button_color' == flagName) { 
          // FmeFlagName.DiscountCouponButtonColor.equals(flagName)
          final resultInt = int.tryParse(userKey);

          result = (null != resultInt && resultInt > 30) ? 
            'FF5C868B': // teal
            'FFE7BD5A'; // gold
        }

        log('[fme_state] flagName is $flagName, getTreatment result is'
          ' $result');

        reply(
          FmeTopics.featureFlags,
          {
            'flagName': flagName,
            'userKey': userKey,
            'treatment': result,
          },
          sink
        );

      case 'track':

        final eventType  = payload['eventType']  as String?;
        final eventValue = payload['eventValue'] as int?;
        final userKey    = payload['userKey']    as String?;

        if (null == userKey || null == eventType) return;
        if (/*!FmeEventType.exists(eventType) || */_fme is String) return;

        log('[fme_state] sending event for $userKey: $eventType'
          ' ($eventValue).');
    }
  }
}

/// The global singleton server state instance.
final fmeState = FmeState();
