import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/base/base_controller.dart';
import 'package:xlo_flutter/core/pages/base/base_page.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/features/ad/presenter/ad/ad_module.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/save_ad_module.dart';
import 'package:xlo_flutter/features/home/presenter/home_module.dart';

class BaseModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => BaseController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => BasePage()),
    ChildRoute(homeRouter, child: (_, args) => HomeModule()),
    ChildRoute(saveAdRouter, child: (_, args) => SaveAdModule()),
    ModuleRoute(adRouter, module: AdModule()),
  ];
}
