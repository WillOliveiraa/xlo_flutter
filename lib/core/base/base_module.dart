import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/base/base_controller.dart';
import 'package:xlo_flutter/core/base/base_page.dart';
import 'package:xlo_flutter/features/home/presenter/home_module.dart';

class BaseModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => BaseController()),
    ...HomeModule.export,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => BasePage()),
    // ModuleRoute(baseRouter, module: BaseModule()),
  ];
}
