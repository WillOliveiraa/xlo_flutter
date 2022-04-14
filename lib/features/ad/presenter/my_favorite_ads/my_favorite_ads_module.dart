import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_my_favorite_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_my_favorite_ads_usecase/get_my_favorite_ads_usecase.dart';
import 'package:xlo_flutter/features/ad/external/get_my_favorite_ads_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/data/repositories/remove_favorite_ad_repository_imp.dart';
import 'package:xlo_flutter/features/ad/data/repositories/save_favorite_ad_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/remove_favorite_ad_usecase/remove_favorite_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_favorite_ad_usecase/save_favorite_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/external/remove_favorite_ad_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/external/save_favorite_ad_datasource_imp.dart';

import 'my_favorite_ads_controller.dart';
import 'my_favorite_ads_page.dart';

class MyFavoriteAdsModule extends Module {
  @override
  final List<Bind> binds = [];

  static List<Bind> export = [
    // datasources
    Bind.singleton((i) => GetMyFavoriteAdsDatasourceImp()),
    Bind.singleton((i) => SaveFavoriteAdDatasourceImp()),
    Bind.singleton((i) => RemoveFavoriteAdDatasourceImp()),
    // repositories
    Bind.singleton((i) => GetMyFavoriteAdsRepositoryImp(i())),
    Bind.singleton((i) => SaveFavoriteAdRepositoryImp(i())),
    Bind.singleton((i) => RemoveFavoriteAdRepositoryImp(i())),
    // usecases
    Bind.singleton((i) => GetMyFavoriteAdsUseCaseImp(i())),
    Bind.singleton((i) => SaveFavoriteAdUseCaseImp(i())),
    Bind.singleton((i) => RemoveFavoriteAdUseCaseImp(i())),
    // controllers
    Bind.singleton((i) => MyFavoriteAdsController(i(), i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => MyFavoriteAdsPage()),
  ];
}
