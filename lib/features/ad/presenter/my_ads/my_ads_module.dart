import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_my_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_my_ads_usecase/get_my_ads_usecase.dart';
import 'package:xlo_flutter/features/ad/external/get_my_ads_datasource_imp.dart';

import 'my_ads_controller.dart';
import 'my_ads_page.dart';

class MyAdsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => GetMyAdsDatasourceImp()),
    Bind.singleton((i) => GetMyAdsRepositoryImp(i())),
    Bind.singleton((i) => GetMyAdsUseCaseImp(i())),
    Bind.singleton((i) => MyAdsController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => MyAdsPage()),
  ];
}
