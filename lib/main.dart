import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'core/base/base_page.dart';
import 'core/injection/container_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _parseInitialize();
  ContainerInjection.setup();
  runApp(MyApp());
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        // appBarTheme: const AppBarTheme(elevation: 0),
      ),
      // home: HomePage(controller: i.get<TestController>()),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
          default:
            return MaterialPageRoute(
                builder: (_) => BasePage(), settings: settings);
        }
      },
    );
  }
}
