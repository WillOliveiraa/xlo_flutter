import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_my_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/data/repositories/update_ad_status_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_my_ads_usecase/get_my_ads_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/update_ad_status_usecase/update_ad_status_usecase.dart';
import 'package:xlo_flutter/features/ad/external/get_my_ads_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/external/update_ad_status_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/presenter/my_ads/my_ads_controller.dart';
import 'package:xlo_flutter/features/ad/presenter/my_ads/my_ads_page.dart';

class MyAdsModule extends Module {
  @override
  final List<Bind> binds = [
    // datasources
    Bind.singleton((i) => GetMyAdsDatasourceImp()),
    Bind.singleton((i) => UpdateAdStatusDatasourceImp()),
    // repositories
    Bind.singleton((i) => GetMyAdsRepositoryImp(i())),
    Bind.singleton((i) => UpdateAdStatusRepositoryImp(i())),
    // usecases
    Bind.singleton((i) => GetMyAdsUseCaseImp(i())),
    Bind.singleton((i) => UpdateAdStatusUseCaseImp(i())),
    // controllers
    Bind.singleton((i) => MyAdsController(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const MyAdsPage()),
  ];
}
