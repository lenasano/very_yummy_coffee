// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'fme_bloc.dart';

class FmeStatusMapper extends EnumMapper<FmeStatus> {
  FmeStatusMapper._();

  static FmeStatusMapper? _instance;
  static FmeStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FmeStatusMapper._());
    }
    return _instance!;
  }

  static FmeStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FmeStatus decode(dynamic value) {
    switch (value) {
      case r'loading':
        return FmeStatus.loading;
      case r'success':
        return FmeStatus.success;
      case r'failure':
        return FmeStatus.failure;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FmeStatus self) {
    switch (self) {
      case FmeStatus.loading:
        return r'loading';
      case FmeStatus.success:
        return r'success';
      case FmeStatus.failure:
        return r'failure';
    }
  }
}

extension FmeStatusMapperExtension on FmeStatus {
  String toValue() {
    FmeStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FmeStatus>(this) as String;
  }
}

class FmeEventMapper extends ClassMapperBase<FmeEvent> {
  FmeEventMapper._();

  static FmeEventMapper? _instance;
  static FmeEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FmeEventMapper._());
      FmeInitialDataLoadedMapper.ensureInitialized();
      FmeTrackEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FmeEvent';

  @override
  final MappableFields<FmeEvent> fields = const {};

  static FmeEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('FmeEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static FmeEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FmeEvent>(map);
  }

  static FmeEvent fromJson(String json) {
    return ensureInitialized().decodeJson<FmeEvent>(json);
  }
}

mixin FmeEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  FmeEventCopyWith<FmeEvent, FmeEvent, FmeEvent> get copyWith;
}

abstract class FmeEventCopyWith<$R, $In extends FmeEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  FmeEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class FmeInitialDataLoadedMapper extends ClassMapperBase<FmeInitialDataLoaded> {
  FmeInitialDataLoadedMapper._();

  static FmeInitialDataLoadedMapper? _instance;
  static FmeInitialDataLoadedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FmeInitialDataLoadedMapper._());
      FmeEventMapper.ensureInitialized();
      FlagResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FmeInitialDataLoaded';

  static FlagResponse _$flagResponse(FmeInitialDataLoaded v) => v.flagResponse;
  static const Field<FmeInitialDataLoaded, FlagResponse> _f$flagResponse =
      Field('flagResponse', _$flagResponse);

  @override
  final MappableFields<FmeInitialDataLoaded> fields = const {
    #flagResponse: _f$flagResponse,
  };

  static FmeInitialDataLoaded _instantiate(DecodingData data) {
    return FmeInitialDataLoaded(data.dec(_f$flagResponse));
  }

  @override
  final Function instantiate = _instantiate;

  static FmeInitialDataLoaded fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FmeInitialDataLoaded>(map);
  }

  static FmeInitialDataLoaded fromJson(String json) {
    return ensureInitialized().decodeJson<FmeInitialDataLoaded>(json);
  }
}

mixin FmeInitialDataLoadedMappable {
  String toJson() {
    return FmeInitialDataLoadedMapper.ensureInitialized()
        .encodeJson<FmeInitialDataLoaded>(this as FmeInitialDataLoaded);
  }

  Map<String, dynamic> toMap() {
    return FmeInitialDataLoadedMapper.ensureInitialized()
        .encodeMap<FmeInitialDataLoaded>(this as FmeInitialDataLoaded);
  }

  FmeInitialDataLoadedCopyWith<
    FmeInitialDataLoaded,
    FmeInitialDataLoaded,
    FmeInitialDataLoaded
  >
  get copyWith =>
      _FmeInitialDataLoadedCopyWithImpl<
        FmeInitialDataLoaded,
        FmeInitialDataLoaded
      >(this as FmeInitialDataLoaded, $identity, $identity);
  @override
  String toString() {
    return FmeInitialDataLoadedMapper.ensureInitialized().stringifyValue(
      this as FmeInitialDataLoaded,
    );
  }

  @override
  bool operator ==(Object other) {
    return FmeInitialDataLoadedMapper.ensureInitialized().equalsValue(
      this as FmeInitialDataLoaded,
      other,
    );
  }

  @override
  int get hashCode {
    return FmeInitialDataLoadedMapper.ensureInitialized().hashValue(
      this as FmeInitialDataLoaded,
    );
  }
}

extension FmeInitialDataLoadedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FmeInitialDataLoaded, $Out> {
  FmeInitialDataLoadedCopyWith<$R, FmeInitialDataLoaded, $Out>
  get $asFmeInitialDataLoaded => $base.as(
    (v, t, t2) => _FmeInitialDataLoadedCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FmeInitialDataLoadedCopyWith<
  $R,
  $In extends FmeInitialDataLoaded,
  $Out
>
    implements FmeEventCopyWith<$R, $In, $Out> {
  FlagResponseCopyWith<$R, FlagResponse, FlagResponse> get flagResponse;
  @override
  $R call({FlagResponse? flagResponse});
  FmeInitialDataLoadedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FmeInitialDataLoadedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FmeInitialDataLoaded, $Out>
    implements FmeInitialDataLoadedCopyWith<$R, FmeInitialDataLoaded, $Out> {
  _FmeInitialDataLoadedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FmeInitialDataLoaded> $mapper =
      FmeInitialDataLoadedMapper.ensureInitialized();
  @override
  FlagResponseCopyWith<$R, FlagResponse, FlagResponse> get flagResponse =>
      $value.flagResponse.copyWith.$chain((v) => call(flagResponse: v));
  @override
  $R call({FlagResponse? flagResponse}) => $apply(
    FieldCopyWithData({if (flagResponse != null) #flagResponse: flagResponse}),
  );
  @override
  FmeInitialDataLoaded $make(CopyWithData data) =>
      FmeInitialDataLoaded(data.get(#flagResponse, or: $value.flagResponse));

  @override
  FmeInitialDataLoadedCopyWith<$R2, FmeInitialDataLoaded, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FmeInitialDataLoadedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FmeTrackEventMapper extends ClassMapperBase<FmeTrackEvent> {
  FmeTrackEventMapper._();

  static FmeTrackEventMapper? _instance;
  static FmeTrackEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FmeTrackEventMapper._());
      FmeEventMapper.ensureInitialized();
      FmeProfitInCentsEventMapper.ensureInitialized();
      FmeNumberOfItemsEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FmeTrackEvent';

  static const Field<FmeTrackEvent, FmeEventType> _f$type = Field(
    'type',
    null,
    mode: FieldMode.param,
  );
  static int _$value(FmeTrackEvent v) => v.value;
  static const Field<FmeTrackEvent, int> _f$value = Field(
    'value',
    _$value,
    opt: true,
    def: 0,
  );
  static String _$stype(FmeTrackEvent v) => v.stype;
  static const Field<FmeTrackEvent, String> _f$stype = Field(
    'stype',
    _$stype,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<FmeTrackEvent> fields = const {
    #type: _f$type,
    #value: _f$value,
    #stype: _f$stype,
  };

  static FmeTrackEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('FmeTrackEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static FmeTrackEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FmeTrackEvent>(map);
  }

  static FmeTrackEvent fromJson(String json) {
    return ensureInitialized().decodeJson<FmeTrackEvent>(json);
  }
}

mixin FmeTrackEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  FmeTrackEventCopyWith<FmeTrackEvent, FmeTrackEvent, FmeTrackEvent>
  get copyWith;
}

abstract class FmeTrackEventCopyWith<$R, $In extends FmeTrackEvent, $Out>
    implements FmeEventCopyWith<$R, $In, $Out> {
  @override
  $R call({int? value});
  FmeTrackEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class FmeProfitInCentsEventMapper
    extends ClassMapperBase<FmeProfitInCentsEvent> {
  FmeProfitInCentsEventMapper._();

  static FmeProfitInCentsEventMapper? _instance;
  static FmeProfitInCentsEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FmeProfitInCentsEventMapper._());
      FmeTrackEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FmeProfitInCentsEvent';

  static int _$value(FmeProfitInCentsEvent v) => v.value;
  static const Field<FmeProfitInCentsEvent, int> _f$value = Field(
    'value',
    _$value,
  );
  static String _$stype(FmeProfitInCentsEvent v) => v.stype;
  static const Field<FmeProfitInCentsEvent, String> _f$stype = Field(
    'stype',
    _$stype,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<FmeProfitInCentsEvent> fields = const {
    #value: _f$value,
    #stype: _f$stype,
  };

  static FmeProfitInCentsEvent _instantiate(DecodingData data) {
    return FmeProfitInCentsEvent(value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static FmeProfitInCentsEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FmeProfitInCentsEvent>(map);
  }

  static FmeProfitInCentsEvent fromJson(String json) {
    return ensureInitialized().decodeJson<FmeProfitInCentsEvent>(json);
  }
}

mixin FmeProfitInCentsEventMappable {
  String toJson() {
    return FmeProfitInCentsEventMapper.ensureInitialized()
        .encodeJson<FmeProfitInCentsEvent>(this as FmeProfitInCentsEvent);
  }

  Map<String, dynamic> toMap() {
    return FmeProfitInCentsEventMapper.ensureInitialized()
        .encodeMap<FmeProfitInCentsEvent>(this as FmeProfitInCentsEvent);
  }

  FmeProfitInCentsEventCopyWith<
    FmeProfitInCentsEvent,
    FmeProfitInCentsEvent,
    FmeProfitInCentsEvent
  >
  get copyWith =>
      _FmeProfitInCentsEventCopyWithImpl<
        FmeProfitInCentsEvent,
        FmeProfitInCentsEvent
      >(this as FmeProfitInCentsEvent, $identity, $identity);
  @override
  String toString() {
    return FmeProfitInCentsEventMapper.ensureInitialized().stringifyValue(
      this as FmeProfitInCentsEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return FmeProfitInCentsEventMapper.ensureInitialized().equalsValue(
      this as FmeProfitInCentsEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return FmeProfitInCentsEventMapper.ensureInitialized().hashValue(
      this as FmeProfitInCentsEvent,
    );
  }
}

extension FmeProfitInCentsEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FmeProfitInCentsEvent, $Out> {
  FmeProfitInCentsEventCopyWith<$R, FmeProfitInCentsEvent, $Out>
  get $asFmeProfitInCentsEvent => $base.as(
    (v, t, t2) => _FmeProfitInCentsEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FmeProfitInCentsEventCopyWith<
  $R,
  $In extends FmeProfitInCentsEvent,
  $Out
>
    implements FmeTrackEventCopyWith<$R, $In, $Out> {
  @override
  $R call({int? value});
  FmeProfitInCentsEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FmeProfitInCentsEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FmeProfitInCentsEvent, $Out>
    implements FmeProfitInCentsEventCopyWith<$R, FmeProfitInCentsEvent, $Out> {
  _FmeProfitInCentsEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FmeProfitInCentsEvent> $mapper =
      FmeProfitInCentsEventMapper.ensureInitialized();
  @override
  $R call({int? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  FmeProfitInCentsEvent $make(CopyWithData data) =>
      FmeProfitInCentsEvent(value: data.get(#value, or: $value.value));

  @override
  FmeProfitInCentsEventCopyWith<$R2, FmeProfitInCentsEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FmeProfitInCentsEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FmeNumberOfItemsEventMapper
    extends ClassMapperBase<FmeNumberOfItemsEvent> {
  FmeNumberOfItemsEventMapper._();

  static FmeNumberOfItemsEventMapper? _instance;
  static FmeNumberOfItemsEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FmeNumberOfItemsEventMapper._());
      FmeTrackEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FmeNumberOfItemsEvent';

  static int _$value(FmeNumberOfItemsEvent v) => v.value;
  static const Field<FmeNumberOfItemsEvent, int> _f$value = Field(
    'value',
    _$value,
  );
  static String _$stype(FmeNumberOfItemsEvent v) => v.stype;
  static const Field<FmeNumberOfItemsEvent, String> _f$stype = Field(
    'stype',
    _$stype,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<FmeNumberOfItemsEvent> fields = const {
    #value: _f$value,
    #stype: _f$stype,
  };

  static FmeNumberOfItemsEvent _instantiate(DecodingData data) {
    return FmeNumberOfItemsEvent(value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static FmeNumberOfItemsEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FmeNumberOfItemsEvent>(map);
  }

  static FmeNumberOfItemsEvent fromJson(String json) {
    return ensureInitialized().decodeJson<FmeNumberOfItemsEvent>(json);
  }
}

mixin FmeNumberOfItemsEventMappable {
  String toJson() {
    return FmeNumberOfItemsEventMapper.ensureInitialized()
        .encodeJson<FmeNumberOfItemsEvent>(this as FmeNumberOfItemsEvent);
  }

  Map<String, dynamic> toMap() {
    return FmeNumberOfItemsEventMapper.ensureInitialized()
        .encodeMap<FmeNumberOfItemsEvent>(this as FmeNumberOfItemsEvent);
  }

  FmeNumberOfItemsEventCopyWith<
    FmeNumberOfItemsEvent,
    FmeNumberOfItemsEvent,
    FmeNumberOfItemsEvent
  >
  get copyWith =>
      _FmeNumberOfItemsEventCopyWithImpl<
        FmeNumberOfItemsEvent,
        FmeNumberOfItemsEvent
      >(this as FmeNumberOfItemsEvent, $identity, $identity);
  @override
  String toString() {
    return FmeNumberOfItemsEventMapper.ensureInitialized().stringifyValue(
      this as FmeNumberOfItemsEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return FmeNumberOfItemsEventMapper.ensureInitialized().equalsValue(
      this as FmeNumberOfItemsEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return FmeNumberOfItemsEventMapper.ensureInitialized().hashValue(
      this as FmeNumberOfItemsEvent,
    );
  }
}

extension FmeNumberOfItemsEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FmeNumberOfItemsEvent, $Out> {
  FmeNumberOfItemsEventCopyWith<$R, FmeNumberOfItemsEvent, $Out>
  get $asFmeNumberOfItemsEvent => $base.as(
    (v, t, t2) => _FmeNumberOfItemsEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FmeNumberOfItemsEventCopyWith<
  $R,
  $In extends FmeNumberOfItemsEvent,
  $Out
>
    implements FmeTrackEventCopyWith<$R, $In, $Out> {
  @override
  $R call({int? value});
  FmeNumberOfItemsEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FmeNumberOfItemsEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FmeNumberOfItemsEvent, $Out>
    implements FmeNumberOfItemsEventCopyWith<$R, FmeNumberOfItemsEvent, $Out> {
  _FmeNumberOfItemsEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FmeNumberOfItemsEvent> $mapper =
      FmeNumberOfItemsEventMapper.ensureInitialized();
  @override
  $R call({int? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  FmeNumberOfItemsEvent $make(CopyWithData data) =>
      FmeNumberOfItemsEvent(value: data.get(#value, or: $value.value));

  @override
  FmeNumberOfItemsEventCopyWith<$R2, FmeNumberOfItemsEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FmeNumberOfItemsEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FmeStateMapper extends ClassMapperBase<FmeState> {
  FmeStateMapper._();

  static FmeStateMapper? _instance;
  static FmeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FmeStateMapper._());
      FmeStatusMapper.ensureInitialized();
      FlagResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FmeState';

  static FmeStatus _$status(FmeState v) => v.status;
  static const Field<FmeState, FmeStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: FmeStatus.loading,
  );
  static FlagResponse? _$flagResponse(FmeState v) => v.flagResponse;
  static const Field<FmeState, FlagResponse> _f$flagResponse = Field(
    'flagResponse',
    _$flagResponse,
    opt: true,
  );

  @override
  final MappableFields<FmeState> fields = const {
    #status: _f$status,
    #flagResponse: _f$flagResponse,
  };

  static FmeState _instantiate(DecodingData data) {
    return FmeState(
      status: data.dec(_f$status),
      flagResponse: data.dec(_f$flagResponse),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FmeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FmeState>(map);
  }

  static FmeState fromJson(String json) {
    return ensureInitialized().decodeJson<FmeState>(json);
  }
}

mixin FmeStateMappable {
  String toJson() {
    return FmeStateMapper.ensureInitialized().encodeJson<FmeState>(
      this as FmeState,
    );
  }

  Map<String, dynamic> toMap() {
    return FmeStateMapper.ensureInitialized().encodeMap<FmeState>(
      this as FmeState,
    );
  }

  FmeStateCopyWith<FmeState, FmeState, FmeState> get copyWith =>
      _FmeStateCopyWithImpl<FmeState, FmeState>(
        this as FmeState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FmeStateMapper.ensureInitialized().stringifyValue(this as FmeState);
  }

  @override
  bool operator ==(Object other) {
    return FmeStateMapper.ensureInitialized().equalsValue(
      this as FmeState,
      other,
    );
  }

  @override
  int get hashCode {
    return FmeStateMapper.ensureInitialized().hashValue(this as FmeState);
  }
}

extension FmeStateValueCopy<$R, $Out> on ObjectCopyWith<$R, FmeState, $Out> {
  FmeStateCopyWith<$R, FmeState, $Out> get $asFmeState =>
      $base.as((v, t, t2) => _FmeStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FmeStateCopyWith<$R, $In extends FmeState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  FlagResponseCopyWith<$R, FlagResponse, FlagResponse>? get flagResponse;
  $R call({FmeStatus? status, FlagResponse? flagResponse});
  FmeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FmeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FmeState, $Out>
    implements FmeStateCopyWith<$R, FmeState, $Out> {
  _FmeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FmeState> $mapper =
      FmeStateMapper.ensureInitialized();
  @override
  FlagResponseCopyWith<$R, FlagResponse, FlagResponse>? get flagResponse =>
      $value.flagResponse?.copyWith.$chain((v) => call(flagResponse: v));
  @override
  $R call({FmeStatus? status, Object? flagResponse = $none}) => $apply(
    FieldCopyWithData({
      if (status != null) #status: status,
      if (flagResponse != $none) #flagResponse: flagResponse,
    }),
  );
  @override
  FmeState $make(CopyWithData data) => FmeState(
    status: data.get(#status, or: $value.status),
    flagResponse: data.get(#flagResponse, or: $value.flagResponse),
  );

  @override
  FmeStateCopyWith<$R2, FmeState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FmeStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

