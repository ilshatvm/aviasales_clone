import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:aviasales_clone/app/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key, required this.airTicketsRepository});

  final AirTicketsRepository airTicketsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: airTicketsRepository,
      child: BlocProvider(
        create: (context) => AirTicketsBloc(repository: airTicketsRepository)
          ..add(AirTicketsEventLoadOffers()),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aviasales Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.blue,
        ),
        fontFamily: "SFPro",
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
