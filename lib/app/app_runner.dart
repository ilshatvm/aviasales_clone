import 'dart:async';
import 'dart:developer';

import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:aviasales_clone/app/app.dart';
import 'package:aviasales_clone/app/app_bloc_observer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class AppRunner {
  Future<void> run() async {
    runZonedGuarded(
      () async {
        await _init();
        final dio = Dio();
        final airTicketsRepository = AirTicketsRepository(dio);
        runApp(App(airTicketsRepository: airTicketsRepository));
      },
      (error, st) async => log(
        error.toString(),
        stackTrace: st,
        error: error,
      ),
    );
  }

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = const AppBlocObserver();
    Intl.defaultLocale = 'ru';
    await initializeDateFormatting();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );
  }
}
