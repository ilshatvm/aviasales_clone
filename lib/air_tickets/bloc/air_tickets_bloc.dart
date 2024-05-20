import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'air_tickets_event.dart';
part 'air_tickets_state.dart';

class AirTicketsBloc extends Bloc<AirTicketsEvent, AirTicketsState> {
  final AirTicketsRepository repository;

  AirTicketsBloc({required this.repository}) : super(AirTicketsInitial()) {
    on<AirTicketsEventLoadOffers>(_onLoadOffers);
  }

  Future<void> _onLoadOffers(
    AirTicketsEventLoadOffers event,
    Emitter<AirTicketsState> emit,
  ) async {
    emit(AirTicketsLoading());
    try {
      final offers = await repository.getOffers();
      emit(AirTicketsLoaded(offers: offers));
    } catch (e) {
      emit(AirTicketsError(message: e.toString()));
    }
  }
}
