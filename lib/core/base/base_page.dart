import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_flutter/features/ad/presenter/ad_page.dart';
import 'package:xlo_flutter/features/home/presenter/home_module.dart';

import 'base_controller.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends ModularState<BasePage, BaseController> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    reaction((_) => controller.page,
        (page) => pageController.jumpToPage(page as int));
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomeModule(),
        AdPage(),
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
    );
  }
}
