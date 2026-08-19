import 'dart:convert';
import 'dart:developer';

import 'package:api/src/fme_state.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:feature_management_experimentation_models/fme_models.dart';

Handler get onRequest => webSocketHandler((channel, protocol) {
  log('[fme] client connected');
  final sink = channel.sink;

  channel.stream.listen(
    (message) {
      log('[fme] received: $message');
      final json = jsonDecode(message as String) as Map<String, dynamic>;

      try {
        final msg = RpcClientMessageMapper.fromMap(json);
        switch (msg) {
          case RpcSubscribeMessage(:final topic):
            log('[fme] subscribe: $topic');
            fmeState.subscribe(topic, sink);

          case RpcUnsubscribeMessage(:final topic):
            log('[fme] unsubscribe: $topic');
            fmeState.unsubscribe(topic, sink);

          case RpcActionClientMessage(:final action, :final payload):
            log('[fme] action: $action');
            fmeState.handleAction(action, payload, sink);
        }
      } on Exception catch (e) {
        log('[fme] malformed message: $e');
      }
    },
    onDone: () {
      log('[fme] client disconnected');
      fmeState.removeAllSubscriptions(sink);
    },
  );
});
