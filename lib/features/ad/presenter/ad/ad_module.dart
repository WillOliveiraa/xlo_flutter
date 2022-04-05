import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/update_ad_views_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/update_ad_views_usecase/update_ad_views_usecase.dart';
import 'package:xlo_flutter/features/ad/external/update_ad_views_datasource_imp.dart';

import 'ad_controller.dart';
import 'ad_page.dart';

class AdModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => UpdateAdViewsDatasourceImp()),
    Bind.singleton((i) => UpdateAdViewsRepositoryImp(i())),
    Bind.singleton((i) => UpdateAdViewsUseCaseImp(i())),
    Bind.singleton((i) => AdController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => AdPage(args.data as AdModel)),
  ];
}
