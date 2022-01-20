import 'package:get_it/get_it.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_ads_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/external/get_all_ads_datasource.dart';
import 'package:xlo_flutter/features/home/presenter/test_controller.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/data/repositories/save_ad_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_ad_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/external/save_ad_datasource_imp.dart';

final i = GetIt.instance;

class ContainerInjection {
  static void setup() {
    i.registerLazySingleton<SaveAdDatasource>(() => SaveAdDatasourceImp());
    i.registerLazySingleton<GetAllAdsDatasource>(
        () => GetAllAdsDatasourceImp());

    i.registerLazySingleton<SaveAdRepository>(
        () => SaveAdRepositoryImp(i.get()));
    i.registerLazySingleton<GetAllAdsRepository>(
        () => GetAllAdsRepositoryImp(i.get()));

    i.registerLazySingleton<SaveAdUseCaseImp>(() => SaveAdUseCaseImp(i.get()));
    i.registerLazySingleton<GetAllAdsUseCaseImp>(
        () => GetAllAdsUseCaseImp(i.get()));

    i.registerFactory<TestController>(() => TestController(i.get(), i.get()));
  }
}
