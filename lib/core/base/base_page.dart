import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_flutter/features/ad/presenter/ad_page.dart';
import 'package:xlo_flutter/features/home/presenter/home_page.dart';
import 'package:xlo_flutter/features/home/presenter/home_controller.dart';

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
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          AdPage(),
          HomePage(controller: context.read<HomeController>()),
          Scaffold(
            appBar: AppBar(title: Text('Chat')),
            drawer: CustomDrawer(),
            body: Container(color: Colors.blue),
          ),
          Scaffold(
            appBar: AppBar(title: Text('Favorites')),
            drawer: CustomDrawer(),
            body: Container(color: Colors.pink),
          ),
          Scaffold(
            appBar: AppBar(title: Text('My Account')),
            drawer: CustomDrawer(),
            body: Container(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
