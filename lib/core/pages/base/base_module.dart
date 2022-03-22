import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/base/base_controller.dart';
import 'package:xlo_flutter/core/pages/base/base_page.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/features/ad/presenter/ad/ad_module.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/save_ad_module.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/sign_up_user_module.dart';
import 'package:xlo_flutter/features/home/presenter/filter/filter_module.dart';
import 'package:xlo_flutter/features/home/presenter/home/home_module.dart';

class BaseModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => BaseController()),
    ...SaveAdModule.export,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => BasePage()),
    ChildRoute(homeRouter, child: (_, args) => HomeModule()),
    ModuleRoute(saveAdRouter, module: SaveAdModule()),
    ModuleRoute(adRouter, module: AdModule()),
    ModuleRoute(filterRouter, module: FilterModule()),
    ModuleRoute(signUpRouter, module: SignUpUserModule()),
  ];
}
