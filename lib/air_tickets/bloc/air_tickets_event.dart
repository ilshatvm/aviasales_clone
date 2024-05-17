part of 'air_tickets_bloc.dart';

sealed class AirTicketsEvent extends Equatable {}

final class AirTicketsEventLoad extends AirTicketsEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
