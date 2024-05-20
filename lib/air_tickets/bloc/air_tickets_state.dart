part of 'air_tickets_bloc.dart';

enum AirTicketsStatus {
  initial,
  loading,
  success,
  failure;
}

final class AirTicketsState extends Equatable {
  const AirTicketsState({
    required this.status,
    required this.offers,
    this.from,
    this.to,
  });

  factory AirTicketsState.init() => AirTicketsState(
        status: AirTicketsStatus.initial,
        offers: Offers(offers: []),
        from: '',
        to: '',
      );

  final AirTicketsStatus status;
  final Offers offers;
  final String? from;
  final String? to;

  AirTicketsState copyWith({
    AirTicketsStatus? status,
    Offers? offers,
    String? from,
    String? to,
  }) {
    return AirTicketsState(
      status: status ?? this.status,
      offers: offers ?? this.offers,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  List<Object?> get props => [status, offers, from, to];
}
