import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/data/repositories/save_user_repository_imp.dart';

import 'package:xlo_flutter/features/auth/data/repositories/sign_up_user_repository_imp.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/save_user_usecase.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/sign_up_user_usecase.dart';
import 'package:xlo_flutter/features/auth/external/save_user_datasource_imp.dart';
import 'package:xlo_flutter/features/auth/external/sign_up_user_datasource_imp.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/sign_up_user_controller.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/sign_up_user_page.dart';

class SignUpUserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SignUpUserDatasourceImp()),
    Bind.singleton((i) => SaveUserDatasourceImp()),
    Bind.singleton((i) => SignUpUserRepositoryImp(i())),
    Bind.singleton((i) => SaveUserRepositoryImp(i())),
    Bind.singleton((i) => SignUpUserUseCaseImp(i())),
    Bind.singleton((i) => SaveUserUseCaseImp(i())),
    Bind.singleton((i) => SignUpUserController(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => SignUpUserPage(args.data as UserModel)),
  ];
}
