part of 'air_tickets_bloc.dart';

sealed class AirTicketsEvent extends Equatable {}

final class AirTicketsEventLoadOffers extends AirTicketsEvent {
  @override
  List<Object?> get props => [];
}

final class AirTicketsEventChangeFromField extends AirTicketsEvent {
  final String from;

  AirTicketsEventChangeFromField({required this.from});

  @override
  List<Object?> get props => [];
}
