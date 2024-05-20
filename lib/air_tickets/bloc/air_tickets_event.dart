part of 'air_tickets_bloc.dart';

sealed class AirTicketsEvent extends Equatable {}

final class AirTicketsEventLoadOffers extends AirTicketsEvent {
  @override
  List<Object?> get props => [];
}
