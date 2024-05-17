import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirTicketsPage extends StatelessWidget {
  const AirTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AirTicketsBloc(
        repository: context.read<AirTicketsRepository>(),
      )..add(AirTicketsEventLoad()),
      child: const AirTicketsView(),
    );
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
          AirTicketsOffers(),
        ],
      ),
    );
  }
}
