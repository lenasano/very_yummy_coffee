/// Constants for WebSocket RPC topic names.
///
/// Use these instead of raw string literals to get compile-time safety
/// for topic names across client and server code.
abstract final class FmeTopics {
  /// Returns the topic for feature flag evaluations.
  static const featureFlags = 'feature_flags';
}
