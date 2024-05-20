part of 'air_tickets_bloc.dart';

sealed class AirTicketsEvent extends Equatable {}

final class AirTicketsEventLoadOffers extends AirTicketsEvent {
  @override
  List<Object?> get props => [];
}

final class AirTicketsEventLoadTicketsOffers extends AirTicketsEvent {
  @override
  List<Object?> get props => [];
}

final class AirTicketsEventChangeFromField extends AirTicketsEvent {
  final String from;

  AirTicketsEventChangeFromField({required this.from});

  @override
  List<Object?> get props => [from];
}

final class AirTicketsEventChangeToField extends AirTicketsEvent {
  final String to;

  AirTicketsEventChangeToField({required this.to});

  @override
  List<Object?> get props => [to];
}

final class AirTicketsEventAddedDeparture extends AirTicketsEvent {
  final DateTime date;

  AirTicketsEventAddedDeparture({required this.date});

  @override
  List<Object?> get props => [date];
}
