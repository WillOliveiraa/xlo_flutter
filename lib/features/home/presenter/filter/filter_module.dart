import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_filter_model.dart';

import 'filter_page.dart';

class FilterModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => FilterPage(args.data as AdFilterModel)),
  ];
}
