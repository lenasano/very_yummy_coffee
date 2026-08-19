import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:fme_repository/fme_repository.dart';

part 'fme_bloc.mapper.dart';
part 'fme_event.dart';
part 'fme_state.dart';

// A base class must be implemented in its own library.
// ignore_for_file: prefer_file_naming_conventions

 // Manages state for FME feature flag evaluations.
 // Usage: Extend this class for each feature flag. Provide a subclass of this
 // bloc to a widget whose state depends on a feature flag evaluation.
sealed class FmeBloc extends Bloc<FmeEvent, FmeState> {
  FmeBloc({
    required FmeRepository fmeRepository,
    required FmeFlagName flagToEvaluate
  })
  : _fmeRepository = fmeRepository,
    _flagName = flagToEvaluate,
    super(const FmeState()) {
    on<FmeInitialDataLoaded>(_onInitialDataLoaded);
    on<FmeProfitInCentsEvent>(_onProfitInCentsEvent);
    on<FmeNumberOfItemsEvent>(_onNumberOfItemsEvent);

    // This constructor reruns each time the widget is shown
    //log('FME BLOC INIT');
    _initFetch();
  }

  final FmeRepository _fmeRepository;
  final FmeFlagName _flagName;
  
  StreamSubscription<FlagResponse>? _flagEvalSubscription;

  void _initFetch() {
  
    _flagEvalSubscription = 
      _fmeRepository.flagEvalsStream
        .where ((flagResponse) => _flagName.equals(flagResponse.flagName))
        .listen((flagResponse) async {
          add(FmeInitialDataLoaded(flagResponse));
          //log('[fme_bloc] subscription'
          //  ' (${identityHashCode(_flagEvalSubscription)}) listened to'
          //  ' $_flagName flag: received result is $flagResponse.');
          await _flagEvalSubscription?.cancel();
        },
        onError: (error) async {
          await _flagEvalSubscription?.cancel();
        }
      );

    _fmeRepository.evaluateFlag(_flagName); 
  }

  Future<void> _onInitialDataLoaded(
    FmeInitialDataLoaded event,
    Emitter<FmeState> emit,
  ) async {
    await emit.forEach(
      _fmeRepository.flagEvalsStream
      .where((flagResponse) => _flagName.equals(flagResponse.flagName)),
      onData: (flagResponse) {
        //log('[fme_bloc] on data: flag name is ${flagResponse.flagName},'
        //  ' treatment is ${flagResponse.treatment}.');
        return state.copyWith(
          flagResponse: flagResponse, 
          status: FmeStatus.success);
      },
      onError: (_, _) => state.copyWith(status: FmeStatus.failure),
    );
  }

  void _onProfitInCentsEvent(FmeTrackEvent event, Emitter<FmeState> _) =>
    _onTrackEvent(FmeEventType.profitInCents, event.value);

  void _onNumberOfItemsEvent(FmeTrackEvent event, Emitter<FmeState> _) =>
    _onTrackEvent(FmeEventType.numberOfItemsPurchased, event.value);

  void _onTrackEvent(FmeEventType eventType, int eventValue) {
    _fmeRepository.submitEvent(
      eventType: eventType, 
      eventValue: eventValue,
    );
  }

  @override
  Future<void> close() async {
    await _flagEvalSubscription?.cancel();
    return super.close();
  }
}

// Create empty subclasses to allow the Flutter framework to use blocs to
// listen to updates from individual flags.

final class FmeFlagDiscountButtonColorBloc extends FmeBloc {
  FmeFlagDiscountButtonColorBloc({required super.fmeRepository}) 
  : super(flagToEvaluate: FmeFlagName.discountCouponButtonColor);
}

final class FmeFlagOfferDiscountBloc extends FmeBloc {
  FmeFlagOfferDiscountBloc({required super.fmeRepository}) 
  : super(flagToEvaluate: FmeFlagName.offerDiscount);
}
