import 'dart:async';
import 'dart:developer';
import 'dart:math' hide log;

import 'package:api_client/api_client.dart';
import 'package:feature_management_experimentation_models/fme_models.dart';
import 'package:fme_repository/fme_repository.dart';
import 'package:rxdart/rxdart.dart';

/// {@template fme_repository}
/// A relay for Feature Management Experimentation (FME).
///
/// All mutations are sent to the server as WebSocket actions, which broadcasts
/// the resulting state change to all subscribed clients. The [flagEvalsStream]
/// subscribes to the 'flag:[[flagName]]' topic on first access and stays active
/// for the session, so all derived streams ([flag:[[flagName]]) stay
/// in sync with the server.
/// {@endtemplate}
class FmeRepository {
  /// {@macro fme_repository}
  FmeRepository({
    required WsFmeClient wsFmeClient
  }) : _wsFmeClient = wsFmeClient;

  final WsFmeClient _wsFmeClient;

  BehaviorSubject<FlagResponse>? _flagEvalsSubject;
  StreamSubscription<Map<String, dynamic>>? _flagWsSub;

  /// Global user key for FME (flag evaluations and event tracking) that allows
  /// a consistent user key during a session (e.g. on a mobile app).
  late final String _fmeUserKey =  
    [0, 10, 15, 20, 25, 30, 35, 40, 45, 50]
    .elementAt(Random().nextInt(10)).toString();

  // For some flags, we don't want to update during a user session, so for these
  // flags, we cache the first flag evaluation result.
  // TODO(me): Test dynamic flag updates.
  final FlagResponseCache _flagCache = FlagResponseCache();

  /// A live stream of all flag evaluations, synced from the server.
  /// Subscribes to the 'feature_flag_evals' WebSocket topic on first access.
  Stream<FlagResponse> get flagEvalsStream {
    _initFlagResponseStreamIfNeeded();
    return _flagEvalsSubject!.stream;
  }

  /// A live stream of all flag evaluations **for the user key** (tracked by
  /// [_fmeUserKey]).
  Stream<FlagResponse?> get flagEvalsForUserKeyStream => 
    flagEvalsStream.where(
      (flagEvals) => flagEvals.userKey == _fmeUserKey);

  /// Evaluates feature flag on the server.
  void evaluateFlag(FmeFlagName flagName) {
    _wsFmeClient.sendAction(
      GetTreatmentAction(flagName: flagName.value, userKey: _fmeUserKey));
  }

  /// Evaluates feature flag on the server.
  void submitEvent({required FmeEventType eventType, int eventValue = 0}) {
    _wsFmeClient.sendAction(
      TrackAction(
        eventType: eventType.value,
        eventValue: eventValue,
        userKey: _fmeUserKey));
  }

  /// Cancels the WebSocket subscription and closes the flag stream.
  ///
  /// Call this when the relay is no longer needed.
  Future<void> dispose() async {
    log('[fme_repository] dispose');

    await _flagWsSub?.cancel();
    await _flagEvalsSubject?.close();

    _flagWsSub = null;
    _flagEvalsSubject = null;
  }

  void _initFlagResponseStreamIfNeeded() {

    log('[fme_repository] (this: ${identityHashCode(this)}) before'
      ' init subject: ${identityHashCode(_flagEvalsSubject)}');

    if (_flagEvalsSubject != null) return;

    _flagEvalsSubject = BehaviorSubject();

    log('[fme_repository] (this: ${identityHashCode(this)}) after'
      ' init subject: ${identityHashCode(_flagEvalsSubject)}');

    _flagWsSub = _wsFmeClient.subscribe(FmeTopics.featureFlags)
      .listen((payload) {
        final flagResponse = FlagResponseMapper.fromMap(payload);

        log('[fme_repository] listening to stream subscription' 
          ' (${identityHashCode(_flagWsSub)}) subject'
          ' ${identityHashCode(_flagEvalsSubject)}, this is the'
          ' flagResponse: $flagResponse.');

        _flagEvalsSubject?.add( _flagCache.filterIfCached(flagResponse) );
      });
  }
}
