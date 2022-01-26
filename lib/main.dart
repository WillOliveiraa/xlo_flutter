import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _parseInitialize();
  runApp(AppWidget());
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
