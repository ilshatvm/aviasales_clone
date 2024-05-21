import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:aviasales_clone/app/app_router.dart';
import 'package:aviasales_clone/common/app_colors.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru')],
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.blue,
        ),
        fontFamily: "SFPro",
        useMaterial3: true,
        filledButtonTheme: const FilledButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(AppColors.white),
            backgroundColor: WidgetStatePropertyAll(AppColors.blue),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                color: AppColors.white,
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
