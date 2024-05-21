import 'package:aviasales_clone/air_tickets/bloc/air_tickets_bloc.dart';
import 'package:aviasales_clone/air_tickets/widget/air_tickets_app_bar.dart';
import 'package:aviasales_clone/air_tickets/widget/air_ticket_card.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAirTicketsPage extends StatelessWidget {
  const AllAirTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 88.0),
        child: const AirTicketsAppBar(),
      ),
      body: Stack(
        children: [
          const AllTickets(),
          FloatingAllTicketsBtn(size: size),
        ],
      ),
    );
  }
}

class FloatingAllTicketsBtn extends StatelessWidget {
  const FloatingAllTicketsBtn({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0,
      left: size.width / 2 - 150,
      child: SizedBox(
        width: 300,
        height: 38,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150.0,
              child: FilledButton.icon(
                icon: const Icon(AppIcons.filter, size: 16.0),
                onPressed: () {},
                label: const Text('Фильтр'),
                style: const ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 150.0,
              child: FilledButton.icon(
                icon: const Icon(AppIcons.chart, size: 16.0),
                onPressed: () {},
                label: const Text('График цен'),
                style: const ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AllTickets extends StatelessWidget {
  const AllTickets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<AirTicketsBloc, AirTicketsState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) => AirTicketCard(
              ticket: state.tickets.tickets![index],
            ),
            itemCount: state.tickets.tickets?.length ?? 0,
            padding: const EdgeInsets.only(bottom: 62.0),
          );
        },
      ),
    );
  }
}
