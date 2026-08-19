import 'dart:developer';
import 'dart:io';

import 'package:api/src/fme_state.dart';
import 'package:api/src/server_state.dart';
import 'package:dart_frog/dart_frog.dart';

Future<void> init(InternetAddress ip, int port) async {
  serverState.loadMenu();
  log('[server] initialized, menu loaded');
  fmeState.initialize();
  log('[fme] initialized, feature flags and segments downloaded');
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  return serve(handler, ip, port);
}
