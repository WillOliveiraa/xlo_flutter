import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/app_module.dart';

import 'app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _parseInitialize();
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

Future<void> _parseInitialize() async {
  await Parse().initialize(
    'dmsYAP5lUL3FwxpGVjPTC0JKkwS7lbcIIsNzVIUz',
    'https://parseapi.back4app.com',
    clientKey: 'nDoBf3jB1uQ2qdcDu72r5wuh7Xy4oxsN0UdSfC1Z',
    autoSendSessionId: true,
    debug: true,
  );
}
