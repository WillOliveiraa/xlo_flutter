import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo_flutter/core/injection/container_injection.dart';
import 'package:xlo_flutter/features/home/presenter/home_page.dart';
import 'package:xlo_flutter/features/home/presenter/test_controller.dart';

import 'base_controller.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => BaseController(pageController),
      child: PageView(
        controller: pageController,
        // physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(controller: i.get<TestController>()),
          Scaffold(body: Container(color: Colors.red)),
          Scaffold(body: Container(color: Colors.blue)),
          Scaffold(body: Container(color: Colors.green)),
        ],
      ),
    );
  }
}
