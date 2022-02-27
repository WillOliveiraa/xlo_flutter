import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/auth/auth_module.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/core/pages/splash/splash_screen_module.dart';

import 'core/pages/base/base_module.dart';
import 'features/auth/presenter/sign_in/sign_in_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...AuthModule.export,
    Bind((i) => Dio(BaseOptions(connectTimeout: 5000, receiveTimeout: 3000))),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashScreenModule()),
    ModuleRoute(baseRouter, module: BaseModule()),
    ModuleRoute(signInRouter, module: SignInModule()),
  ];
}
