part of 'air_tickets_bloc.dart';

sealed class AirTicketsState extends Equatable {}

final class AirTicketsInitial extends AirTicketsState {
  @override
  List<Object?> get props => [];
}

final class AirTicketsLoading extends AirTicketsState {
  @override
  List<Object?> get props => [];
}

final class AirTicketsLoaded extends AirTicketsState {
  final Offers offers;
  AirTicketsLoaded({required this.offers});

  @override
  List<Object?> get props => [offers];
}

final class AirTicketsError extends AirTicketsState {
  final String message;
  AirTicketsError({required this.message});

  @override
  List<Object?> get props => [message];
}
