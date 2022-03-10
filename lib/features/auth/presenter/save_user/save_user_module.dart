import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/auth/presenter/save_user/save_user_controller.dart';
import 'package:xlo_flutter/features/auth/presenter/save_user/save_user_page.dart';

class SaveUserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SaveUserController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SaveUserPage()),
  ];
}
