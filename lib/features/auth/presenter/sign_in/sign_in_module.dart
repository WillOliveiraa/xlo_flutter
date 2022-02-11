import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/features/auth/data/repositories/sign_in_with_email_repository_imp.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/sign_in_with_email_usecase.dart';
import 'package:xlo_flutter/features/auth/external/sign_in_with_email_datasource_imp.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_in/sign_in_controller.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_in/sign_in_page.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/sign_up_user_module.dart';

class SignInModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SignInWithEmailDatasourceImp()),
    Bind.singleton((i) => SignInWithEmailRepositoryImp(i())),
    Bind.singleton((i) => SignInWithEmailUseCaseImp(i())),
    Bind.singleton((i) => SignInController(i(), i())),
    // ...HomeModule.export,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SignInPage()),
    ModuleRoute(signUpRouter, module: SignUpUserModule()),
  ];
}
