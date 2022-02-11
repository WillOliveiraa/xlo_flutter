import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/controllers/auth_controller.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/core/splash/splash_screen_module.dart';

import 'core/base/base_module.dart';
import 'features/auth/presenter/sign_in/sign_in_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashScreenModule()),
    ModuleRoute(baseRouter, module: BaseModule()),
    ModuleRoute(signInRouter, module: SignInModule()),
  ];
}
