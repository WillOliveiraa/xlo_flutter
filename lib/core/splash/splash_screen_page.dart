import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:xlo_flutter/core/controllers/auth_controller.dart';
import 'package:xlo_flutter/core/shared/components/circular_progress_ind_default.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';

class SplashScreenPage extends StatelessWidget {
  // final auth = Modular.get<AuthController>();
  SplashScreenPage() {
    // auth.checkLogin().then((signIn) {
    //   if (signIn) auth.getUserInformation();

    //   return Future.delayed(Duration(seconds: 1));
    // }).then((value) {
    //   Modular.to.pushReplacementNamed("/base");
    // });
    init();
  }
  Future<void> init() async {
    await Future.delayed(Duration(seconds: 2));

    Modular.to.pushReplacementNamed(baseRouter);
  }

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    // SizeConfig().init(context);

    return Material(
      child: Center(
        child: CircularProgressIndDefault(),
      ),
    );
  }
}
