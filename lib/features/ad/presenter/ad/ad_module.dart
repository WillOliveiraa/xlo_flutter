import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

import 'ad_page.dart';

class AdModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => AdPage(args.data as AdModel)),
  ];
}
