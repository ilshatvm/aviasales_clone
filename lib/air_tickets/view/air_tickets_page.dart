import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:flutter/material.dart';

class AirTicketsPage extends StatelessWidget {
  const AirTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AirTicketsView();
  }
}

class AirTicketsView extends StatelessWidget {
  const AirTicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          AirTicketsTitle(),
          AirTicketsSearch(),
          AirTicketsOffers(),
        ],
      ),
    );
  }
}
