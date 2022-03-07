// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_categories_repository_imp.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_filtered_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_categories_usecase/get_all_categories_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_filtered_ads_usecase/get_filtered_ads_usecase.dart';
import 'package:xlo_flutter/features/ad/external/get_all_ads_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/external/get_all_categories_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/external/get_filtered_ads_datasource_imp.dart';
import 'package:xlo_flutter/features/home/presenter/home/home_controller.dart';
import '../filter/filter_controller.dart';
import 'home_page.dart';

class HomeModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    // Datasources
    Bind.singleton((i) => GetAllAdsDatasourceImp()),
    Bind.singleton((i) => GetFilteredAdsDatasourceImp()),
    Bind.singleton((i) => GetAllCategoriesDatasourceImp()),
    // repositories
    Bind.singleton((i) => GetAllAdsRepositoryImp(i())),
    Bind.singleton((i) => GetFilteredAdsRepositoryImp(i())),
    Bind.singleton((i) => GetAllCategoriesRepositoryImp(i())),
    // usecases
    Bind.singleton((i) => GetAllAdsUseCaseImp(i())),
    Bind.singleton((i) => GetFilteredAdsUseCaseImp(i())),
    Bind.singleton((i) => GetAllCategoriesUseCaseImp(i())),
    // controllers
    Bind.singleton((i) => FilterController()),
    Bind.singleton((i) => HomeController(i(), i(), i(), i())),
  ];

  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];

  @override
  Widget get view => HomePage();
}
