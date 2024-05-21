part of 'air_tickets_bloc.dart';

enum AirTicketsStatus {
  initial,
  loading,
  success,
  failure;
}

final class AirTicketsState extends Equatable {
  const AirTicketsState({
    required this.tickets,
    required this.status,
    required this.offers,
    this.from,
    this.to,
    required this.ticketsOffers,
    this.departureDate,
  });

  factory AirTicketsState.init() => AirTicketsState(
        status: AirTicketsStatus.initial,
        offers: Offers(offers: []),
        from: '',
        to: '',
        ticketsOffers: TicketsOffers(ticketsOffers: []),
        departureDate: DateTime.now(),
        tickets: Tickets(tickets: []),
      );

  final AirTicketsStatus status;
  final Offers offers;
  final String? from;
  final String? to;
  final TicketsOffers ticketsOffers;
  final DateTime? departureDate;
  final Tickets tickets;

  AirTicketsState copyWith({
    AirTicketsStatus? status,
    Offers? offers,
    String? from,
    String? to,
    TicketsOffers? ticketsOffers,
    DateTime? departureDate,
    Tickets? tickets,
  }) {
    return AirTicketsState(
      status: status ?? this.status,
      offers: offers ?? this.offers,
      from: from ?? this.from,
      to: to ?? this.to,
      ticketsOffers: ticketsOffers ?? this.ticketsOffers,
      departureDate: departureDate ?? this.departureDate,
      tickets: tickets ?? this.tickets,
    );
  }

  @override
  List<Object?> get props => [
        status,
        offers,
        from,
        to,
        ticketsOffers,
        departureDate,
        tickets,
      ];
}
