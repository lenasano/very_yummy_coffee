import 'package:meta/meta.dart';

/// Typed RPC actions for the WebSocket protocol.
///
/// Each subtype represents a specific server action with typed payload fields.
/// Repositories construct these and pass them to `WsRpcClient.sendAction`,
/// which serializes them to the wire format.
@immutable
sealed class FmeAction {
  const FmeAction();

  /// The wire-format action name (e.g., 'getTreatment').
  String get actionName;

  /// Serializes the action's payload fields to a map.
  Map<String, dynamic> toPayloadMap();
}

/// Evaluates a feature flag with the name [flagName] for the key [userKey].
class GetTreatmentAction extends FmeAction {
  const GetTreatmentAction({
    required this.flagName,
    required this.userKey
    });

  final String flagName;
  final String userKey;

  @override
  String get actionName => 'getTreatment';

  @override
  Map<String, dynamic> toPayloadMap() => {
    'flagName': flagName,
    'userKey': userKey,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetTreatmentAction &&
        other.flagName == flagName &&
        other.userKey == userKey;

  @override
  int get hashCode => Object.hash(
    flagName,
    userKey,
  );
}

/// Tracks user event [eventType] for the key [userKey].
class TrackAction extends FmeAction {
  const TrackAction({
    required this.eventType,
    required this.userKey,
    this.eventValue = 0,
    });

  final String eventType;
  final int eventValue;
  final String userKey;

  @override
  String get actionName => 'track';

  @override
  Map<String, dynamic> toPayloadMap() => {
    'eventType': eventType,
    'eventValue': eventValue,
    'userKey': userKey,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackAction &&
        other.eventType == eventType &&
        other.eventValue == eventValue &&
        other.userKey == userKey;

  @override
  int get hashCode => Object.hash(
    eventType,
    eventValue,
    userKey,
  );
}
