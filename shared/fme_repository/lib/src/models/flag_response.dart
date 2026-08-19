import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

part 'flag_response.mapper.dart';

/// {@template flag}
/// Represents an FME feature flag.
/// {@endtemplate}
@immutable
@MappableClass()
class FlagResponse with FlagResponseMappable {
  /// {@macro flag}
  const FlagResponse({
    required this.flagName,
    this.userKey,
    this.treatment,
  });

  /// The name of the feature flag in FME.
  final String flagName;

  /// The user key that will be used for evaluating the flag. Depending on the 
  /// flag targeting rule, a user key can be matched to a treatment, or assigned
  /// a treatment randomly (by percentage distribution).
  final String? userKey;

  /// The treatment result evaluated for the 'userKey' by the FME feature flag.
  /// This value will be the feature variation evaluated for the 'userKey' by
  /// the FME feature flag targeting rules.
  ///
  /// Set by the FME service on the server. Null before flag evaluation.
  final String? treatment;

  @override
  bool operator ==(Object other) {
    // Check if the other object points to the exact same memory address
    if (identical(this, other)) return true;

    // Check if the other object is of the same type and has matching fields
    return other is FlagResponse &&
        other.flagName == flagName &&
        other.userKey == userKey &&
        other.treatment == treatment;
  }

  @override
  int get hashCode => Object.hash(flagName, userKey, treatment);
}

extension FlagResponseHelpers on FlagResponse {

  bool get isOn => 
    treatment != null && 
    treatment != 'control' && 
    treatment != 'off';

  String? get treatmentWhenOn => isOn ? treatment : null;
}
