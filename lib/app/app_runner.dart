import 'dart:async';
import 'dart:developer';

import 'package:aviasales_clone/app/app.dart';
import 'package:flutter/material.dart';

class AppRunner {
  Future<void> run() async {
    runZonedGuarded(
      () async => runApp(const App()),
      (error, st) async => log(
        error.toString(),
        stackTrace: st,
        error: error,
      ),
    );
  }
}
