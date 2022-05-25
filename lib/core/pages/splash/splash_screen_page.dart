import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/core/shared/widgets/circular_progress_ind_default.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage() {
    auth.checkLogin().then((signIn) {
      return Future.delayed(const Duration(seconds: 1));
    }).then((value) {
      Modular.to.pushReplacementNamed(baseRouter);
    });
  }

  final auth = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child: CircularProgressIndDefault()),
    );
  }
}
