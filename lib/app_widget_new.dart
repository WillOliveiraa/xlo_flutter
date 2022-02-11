import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/core/shared/themes/theme.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      builder: asuka.builder,
      title: 'XLO',
      theme: buildTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    ).modular(); //added by extension
  }
}
