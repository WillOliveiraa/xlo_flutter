import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/test_controller.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/data/repositories/save_ad_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_ad_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/external/save_ad_datasource_imp.dart';

final i = GetIt.instance;

class ContainerInjection {
  static void setup() {
    Parse().initialize(
      'dmsYAP5lUL3FwxpGVjPTC0JKkwS7lbcIIsNzVIUz',
      'https://parseapi.back4app.com',
      clientKey: 'nDoBf3jB1uQ2qdcDu72r5wuh7Xy4oxsN0UdSfC1Z',
      autoSendSessionId: true,
      debug: true,
    );
    i.registerLazySingleton<SaveAdDatasource>(() => SaveAdDatasourceImp());
    i.registerLazySingleton<SaveAdRepository>(
        () => SaveAdRepositoryImp(i.get()));
    i.registerLazySingleton<SaveAdUseCaseImp>(() => SaveAdUseCaseImp(i.get()));
    i.registerFactory<TestController>(() => TestController(i.get()));
  }
}
