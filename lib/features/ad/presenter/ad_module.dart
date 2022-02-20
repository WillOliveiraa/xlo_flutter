// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/repositories/save_ad_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/external/save_ad_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/presenter/ad_controller.dart';
import 'package:xlo_flutter/features/ad/presenter/ad_page.dart';

class AdModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SaveAdDatasourceImp()),
    Bind.singleton((i) => SaveAdRepositoryImp(i())),
    Bind.singleton((i) => SaveAdUseCaseImp(i())),
    Bind.singleton((i) => AdController(i(), i(), i())),
  ];

  @override
  Widget get view => AdPage();
}
