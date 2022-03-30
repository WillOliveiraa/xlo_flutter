import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:intl/date_symbol_data_local.dart';
import 'package:xlo_flutter/core/shared/themes/theme.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    initializeDateFormatting();

    return MaterialApp(
      // showPerformanceOverlay: true, // show performance
      builder: asuka.builder,
      title: 'XLO',
      theme: buildTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // supportedLocales: const [
      //   Locale('pt', 'BR'),
      // ],
    ).modular(); //added by extension
  }
}
