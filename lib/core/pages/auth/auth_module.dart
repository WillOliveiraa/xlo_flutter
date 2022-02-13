import 'package:flutter_modular/flutter_modular.dart';

import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/features/auth/data/repositories/get_current_user_repository_imp.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:xlo_flutter/features/auth/external/get_current_user_datasource_imp.dart';

class AuthModule extends Module {
  static List<Bind> export = [
    Bind.singleton((i) => GetCurrentUserDatasourceImp()),
    Bind.singleton((i) => GetCurrentUserRepositoryImp(i())),
    Bind.singleton((i) => GetCurrentUserImp(i())),
    Bind.singleton((i) => AuthController(i())),
  ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [];
}
