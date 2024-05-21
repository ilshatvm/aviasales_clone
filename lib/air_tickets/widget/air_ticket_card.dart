import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AirTicketCard extends StatelessWidget {
  const AirTicketCard({
    super.key,
    required this.ticket,
  });

  final Ticket ticket;

  double roundWithStep(val, step) {
    return (val / step).round() * step;
  }

  double inFlightTime(DateTime arrival, DateTime departure) {
    final difference = arrival.difference(departure);
    return roundWithStep(difference.inMinutes / 60, 0.5);
  }

  @override
  Widget build(BuildContext context) {
    final flightTime = inFlightTime(ticket.arrival.date, ticket.departure.date);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey1,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket.price.value.toPrice(),
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 40.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.red,
                          radius: 12.0,
                        ),
                      ],
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      children: [
                        Text(
                          ticket.departure.date.to24HoursMinutes(),
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          ticket.departure.airport,
                          style: const TextStyle(
                            color: AppColors.grey6,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('  —  '),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          DateFormat(DateFormat.HOUR24_MINUTE)
                              .format(ticket.arrival.date),
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          ticket.arrival.airport,
                          style: const TextStyle(
                            color: AppColors.grey6,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16.0),
                    Row(
                      children: [
                        Text('$flightTimeч в пути'),
                        ticket.hasTransfer
                            ? const SizedBox()
                            : const Text(' / Без пересадок'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
