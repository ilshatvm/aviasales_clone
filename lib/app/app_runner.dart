import 'dart:async';
import 'dart:developer';

import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:aviasales_clone/app/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppRunner {
  Future<void> run() async {
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
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
}
