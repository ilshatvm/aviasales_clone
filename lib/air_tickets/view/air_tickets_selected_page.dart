import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AirTicketsSelectedPage extends StatelessWidget {
  const AirTicketsSelectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AirTicketsSelectedView();
  }
}

class AirTicketsSelectedView extends StatelessWidget {
  const AirTicketsSelectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(sliver: SelectedSearchBar()),
          SearchCheaps(),
          RecomendationTickets(),
          ViewAllTicketsBtn(),
        ],
      ),
    );
  }
}

class ViewAllTicketsBtn extends StatelessWidget {
  const ViewAllTicketsBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: FilledButton(
            onPressed: () {
              context.read<AirTicketsBloc>().add(AirTicketsEventLoadTickets());
              GoRouter.of(context).go('/tickets/selected/all');
            },
            child: const Text('Посмотреть все билеты')),
      ),
    );
  }
}
