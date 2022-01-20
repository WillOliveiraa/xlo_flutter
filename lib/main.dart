import 'package:flutter/material.dart';

import 'test_controller.dart';
import 'core/injection/container_injection.dart';
import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ContainerInjection.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(controller: i.get<TestController>()),
    );
  }
}
