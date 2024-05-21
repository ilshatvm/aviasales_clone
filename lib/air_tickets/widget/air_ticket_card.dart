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
    return Stack(
      children: [
        Container(
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
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic),
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
                            Text(' — '),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              DateFormat(DateFormat.HOUR24_MINUTE)
                                  .format(ticket.arrival.date),
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic),
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
                        RichText(
                          text: TextSpan(
                            text: '$flightTimeч в пути',
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              ticket.hasTransfer
                                  ? const TextSpan()
                                  : const TextSpan(text: ' / Без пересадок'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ticket.badge != null
            ? AirTicketCardBadge(title: ticket.badge.toString())
            : const SizedBox(),
      ],
    );
  }
}

class AirTicketCardBadge extends StatelessWidget {
  const AirTicketCardBadge({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: AppColors.blueLight,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 2.0,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
