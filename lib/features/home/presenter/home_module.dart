// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/external/get_all_ads_datasource.dart';
import 'package:xlo_flutter/features/home/presenter/home/home_controller.dart';
import 'home/home_page.dart';

class HomeModule extends WidgetModule {
  static List<Bind> export = [
    Bind.singleton((i) => GetAllAdsDatasourceImp()),
    Bind.singleton((i) => GetAllAdsRepositoryImp(i())),
    Bind.singleton((i) => GetAllAdsUseCaseImp(i())),
    Bind.factory((i) => HomeController(i())),
  ];

  @override
  final List<Bind> binds = [];

  // @override
  // final List<ModularRoute> routes = [
  //   ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  // ];

  @override
  Widget get view => HomePage();
}
