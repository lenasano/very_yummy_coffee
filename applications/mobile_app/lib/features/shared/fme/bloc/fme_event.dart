
part of 'fme_bloc.dart';

@MappableClass()
sealed class FmeEvent with FmeEventMappable {
  const FmeEvent();
}

@MappableClass()
class FmeInitialDataLoaded extends FmeEvent
    with FmeInitialDataLoadedMappable {
  const FmeInitialDataLoaded(this.flagResponse);

  final FlagResponse flagResponse;
}

@MappableClass()
sealed class FmeTrackEvent extends FmeEvent {
  FmeTrackEvent({
    required FmeEventType type, 
    this.value = 0})
  : stype = type.value;

  final String stype;
  final int value;
}

@MappableClass()
class FmeProfitInCentsEvent extends FmeTrackEvent
    with FmeProfitInCentsEventMappable {
  FmeProfitInCentsEvent({required super.value}) 
  : super(type: FmeEventType.profitInCents);
}

@MappableClass()
class FmeNumberOfItemsEvent extends FmeTrackEvent
    with FmeNumberOfItemsEventMappable {
  FmeNumberOfItemsEvent({required super.value}) 
  : super(type: FmeEventType.profitInCents);
}
