import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

import 'ad_page.dart';

class AdModule extends Module {
  @override
  final List<Bind> binds = [
    // // datasources
    // Bind.singleton((i) => SaveAdDatasourceImp()),
    // Bind.singleton((i) => FetchByCepDatasourceImp(i())),
    // Bind.singleton((i) => GetAllUfsDatasourceImp(i())),

    // // repositories
    // Bind.singleton((i) => SaveAdRepositoryImp(i())),
    // Bind.singleton((i) => FetchByCepRepositoryImp(i())),
    // Bind.singleton((i) => GetAllUfsRepositoryImp(i())),

    // // usecases
    // Bind.singleton((i) => SaveAdUseCaseImp(i())),
    // Bind.singleton((i) => FetchByCepUseCaseImp(i())),
    // Bind.singleton((i) => GetAllUfsUseCaseImp(i())),

    // // controllers
    // Bind.singleton((i) => CepFieldController(i(), i())),
    // Bind.singleton((i) => SaveAdController(i(), i(), i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => AdPage(args.data as AdModel)),
  ];
}
