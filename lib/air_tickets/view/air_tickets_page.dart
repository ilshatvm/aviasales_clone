import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:aviasales_clone/air_tickets/bloc/air_tickets_bloc.dart';
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
    return Scaffold(
      body: BlocBuilder<AirTicketsBloc, AirTicketsState>(
        builder: (context, state) => switch (state) {
          AirTicketsInitial() => const Center(child: Text("Пока пусто")),
          AirTicketsLoading() => Center(child: CircularProgressIndicator()),
          AirTicketsLoaded() => Center(
              child: Text(state.offers.offers[0].title.toString()),
            ),
          AirTicketsError() => const Center(child: Text("Ошибка")),
        },
      ),
    );
  }
}
