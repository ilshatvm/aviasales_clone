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
    on<AirTicketsEventChangeToField>(_onChangeToField);
    on<AirTicketsEventLoadTicketsOffers>(_onLoadTicketsOffers);
    on<AirTicketsEventAddedDeparture>(_onAddedDeparture);
    on<AirTicketsEventLoadTickets>(_onLoadTickets);
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

  Future<void> _onLoadTicketsOffers(
    AirTicketsEventLoadTicketsOffers event,
    Emitter<AirTicketsState> emit,
  ) async {
    emit(state.copyWith(status: AirTicketsStatus.loading));
    try {
      final ticketsOffers = await repository.getTicketsOffers();
      emit(state.copyWith(
        ticketsOffers: ticketsOffers,
        status: AirTicketsStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: AirTicketsStatus.failure));
    }
  }

  Future<void> _onLoadTickets(
    AirTicketsEventLoadTickets event,
    Emitter<AirTicketsState> emit,
  ) async {
    emit(state.copyWith(status: AirTicketsStatus.loading));
    try {
      final tickets = await repository.getTickets();

      emit(state.copyWith(
        tickets: tickets,
        status: AirTicketsStatus.success,
      ));
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

  Future<void> _onChangeToField(
    AirTicketsEventChangeToField event,
    Emitter<AirTicketsState> emit,
  ) async {
    try {
      emit(state.copyWith(to: event.to));
    } catch (e) {
      emit(state.copyWith(status: AirTicketsStatus.failure));
    }
  }

  Future<void> _onAddedDeparture(
    AirTicketsEventAddedDeparture event,
    Emitter<AirTicketsState> emit,
  ) async {
    try {
      emit(state.copyWith(departureDate: event.date));
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
      ticketsOffers: TicketsOffers.fromJson(json['ticketsOffers']),
      tickets: Tickets.fromJson(json['tickets']),
    );
  }

  @override
  Map<String, dynamic>? toJson(AirTicketsState state) {
    if (state.status == AirTicketsStatus.success) {
      return {
        'offers': state.offers.toJson(),
        'from': state.from,
        'ticketsOffers': state.ticketsOffers.toJson(),
        'tickets': state.tickets.toJson(),
      };
    }
    return null;
  }
}
