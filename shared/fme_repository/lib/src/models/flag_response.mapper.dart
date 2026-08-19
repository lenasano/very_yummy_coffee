// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'flag_response.dart';

class FlagResponseMapper extends ClassMapperBase<FlagResponse> {
  FlagResponseMapper._();

  static FlagResponseMapper? _instance;
  static FlagResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FlagResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FlagResponse';

  static String _$flagName(FlagResponse v) => v.flagName;
  static const Field<FlagResponse, String> _f$flagName = Field(
    'flagName',
    _$flagName,
  );
  static String? _$userKey(FlagResponse v) => v.userKey;
  static const Field<FlagResponse, String> _f$userKey = Field(
    'userKey',
    _$userKey,
    opt: true,
  );
  static String? _$treatment(FlagResponse v) => v.treatment;
  static const Field<FlagResponse, String> _f$treatment = Field(
    'treatment',
    _$treatment,
    opt: true,
  );

  @override
  final MappableFields<FlagResponse> fields = const {
    #flagName: _f$flagName,
    #userKey: _f$userKey,
    #treatment: _f$treatment,
  };

  static FlagResponse _instantiate(DecodingData data) {
    return FlagResponse(
      flagName: data.dec(_f$flagName),
      userKey: data.dec(_f$userKey),
      treatment: data.dec(_f$treatment),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FlagResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FlagResponse>(map);
  }

  static FlagResponse fromJson(String json) {
    return ensureInitialized().decodeJson<FlagResponse>(json);
  }
}

mixin FlagResponseMappable {
  String toJson() {
    return FlagResponseMapper.ensureInitialized().encodeJson<FlagResponse>(
      this as FlagResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return FlagResponseMapper.ensureInitialized().encodeMap<FlagResponse>(
      this as FlagResponse,
    );
  }

  FlagResponseCopyWith<FlagResponse, FlagResponse, FlagResponse> get copyWith =>
      _FlagResponseCopyWithImpl<FlagResponse, FlagResponse>(
        this as FlagResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FlagResponseMapper.ensureInitialized().stringifyValue(this as FlagResponse);
  }

  @override
  bool operator ==(Object other) {
    return FlagResponseMapper.ensureInitialized().equalsValue(
      this as FlagResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return FlagResponseMapper.ensureInitialized().hashValue(this as FlagResponse);
  }
}

extension FlagResponseValueCopy<$R, $Out> on ObjectCopyWith<$R, FlagResponse, $Out> {
  FlagResponseCopyWith<$R, FlagResponse, $Out> get $asFlagResponse =>
      $base.as((v, t, t2) => _FlagResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FlagResponseCopyWith<$R, $In extends FlagResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? flagName, String? userKey, String? treatment});
  FlagResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FlagResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FlagResponse, $Out>
    implements FlagResponseCopyWith<$R, FlagResponse, $Out> {
  _FlagResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FlagResponse> $mapper =
      FlagResponseMapper.ensureInitialized();
  @override
  $R call({
    String? flagName,
    Object? userKey = $none,
    Object? treatment = $none,
  }) => $apply(
    FieldCopyWithData({
      if (flagName != null) #flagName: flagName,
      if (userKey != $none) #userKey: userKey,
      if (treatment != $none) #treatment: treatment,
    }),
  );
  @override
  FlagResponse $make(CopyWithData data) => FlagResponse(
    flagName: data.get(#flagName, or: $value.flagName),
    userKey: data.get(#userKey, or: $value.userKey),
    treatment: data.get(#treatment, or: $value.treatment),
  );

  @override
  FlagResponseCopyWith<$R2, FlagResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FlagResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

