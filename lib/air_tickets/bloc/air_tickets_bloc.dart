import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'air_tickets_event.dart';
part 'air_tickets_state.dart';

class AirTicketsBloc extends HydratedBloc<AirTicketsEvent, AirTicketsState> {
  final AirTicketsRepository repository;

  AirTicketsBloc({required this.repository}) : super(AirTicketsState.init()) {
    on<AirTicketsEventLoadOffers>(_onLoadOffers);
    on<AirTicketsEventChangeFromField>(_onChangeFromField);
  }

  Future<void> _onLoadOffers(
    AirTicketsEventLoadOffers event,
    Emitter<AirTicketsState> emit,
  ) async {
    emit(state.copyWith(status: AirTicketsStatus.loading));
    try {
      final offers = await repository.getOffers();
      emit(state.copyWith(offers: offers, status: AirTicketsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AirTicketsStatus.failure));
    }
  }

  Future<void> _onChangeFromField(
    AirTicketsEventChangeFromField event,
    Emitter<AirTicketsState> emit,
  ) async {
    try {
      emit(state.copyWith(from: event.from));
    } catch (e) {
      emit(state.copyWith(status: AirTicketsStatus.failure));
    }
  }

  @override
  AirTicketsState? fromJson(Map<String, dynamic> json) {
    return AirTicketsState(
      status: AirTicketsStatus.success,
      offers: Offers.fromJson(json['offers']),
      from: json['from'],
    );
  }

  @override
  Map<String, dynamic>? toJson(AirTicketsState state) {
    if (state.status == AirTicketsStatus.success) {
      return {
        'offers': state.offers.toJson(),
        'from': state.from,
      };
    }
    return null;
  }
}
