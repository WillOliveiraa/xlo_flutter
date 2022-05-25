// ignore: implementation_imports
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/fetch_by_cep_repository_imp.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_categories_repository_imp.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_ufs_repository_imp.dart';
import 'package:xlo_flutter/features/ad/data/repositories/save_ad_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/fetch_by_cep_usecase/fetch_by_cep_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_categories_usecase/get_all_categories_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ufs_usecase/get_all_ufs_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/external/fetch_by_cep_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/external/get_all_categories_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/external/get_all_ufs_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/external/save_ad_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/save_ad_controller.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/save_ad_page.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/components/cep_field/cep_field_controller.dart';

class SaveAdModule extends Module {
  @override
  final List<Bind> binds = [];

  static List<Bind> export = [
    // datasources
    Bind.singleton((i) => SaveAdDatasourceImp()),
    Bind.singleton((i) => FetchByCepDatasourceImp(i())),
    Bind.singleton((i) => GetAllUfsDatasourceImp(i())),
    Bind.singleton((i) => GetAllCategoriesDatasourceImp()),

    // repositories
    Bind.singleton((i) => SaveAdRepositoryImp(i())),
    Bind.singleton((i) => FetchByCepRepositoryImp(i())),
    Bind.singleton((i) => GetAllUfsRepositoryImp(i())),
    Bind.singleton((i) => GetAllCategoriesRepositoryImp(i())),

    // usecases
    Bind.singleton((i) => SaveAdUseCaseImp(i())),
    Bind.singleton((i) => FetchByCepUseCaseImp(i())),
    Bind.singleton((i) => GetAllUfsUseCaseImp(i())),
    Bind.singleton((i) => GetAllCategoriesUseCaseImp(i())),

    // controllers
    Bind.singleton((i) => CepFieldController(i(), i())),
    Bind.singleton((i) => SaveAdController(i(), i(), i(), i())),
  ];

  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => SaveAdPage(ad: args.data as AdModel)),
  ];
}
