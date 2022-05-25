import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/update_ad_views_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/update_ad_views_usecase/update_ad_views_usecase.dart';
import 'package:xlo_flutter/features/ad/external/update_ad_views_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/presenter/ad/ad_controller.dart';
import 'package:xlo_flutter/features/ad/presenter/ad/ad_page.dart';

class AdModule extends Module {
  @override
  final List<Bind> binds = [
    // datasources
    Bind.singleton((i) => UpdateAdViewsDatasourceImp()),
    // repositories
    Bind.singleton((i) => UpdateAdViewsRepositoryImp(i())),
    // usecases
    Bind.singleton((i) => UpdateAdViewsUseCaseImp(i())),
    // controllers
    Bind.singleton((i) => AdController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => AdPage(args.data as AdModel)),
  ];
}
