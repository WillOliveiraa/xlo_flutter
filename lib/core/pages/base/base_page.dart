import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_flutter/core/pages/account/account_page.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_flutter/features/home/presenter/home/home_module.dart';

import 'base_controller.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends ModularState<BasePage, BaseController> {
  final PageController pageController = PageController();
  final authController = Modular.get<AuthController>();

  @override
  void initState() {
    super.initState();

    reaction((_) => controller.page, (page) {
      pageController.jumpToPage(page as int);
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final isLoggedIn = authController.isLoggedIn;

      return PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeModule(),
          Scaffold(
            appBar: AppBar(title: Text('Chat')),
            drawer: CustomDrawer(),
            body: Container(color: Colors.blue),
          ),
          if (isLoggedIn)
            Scaffold(
              appBar: AppBar(title: Text('Favorites')),
              drawer: CustomDrawer(),
              body: Container(color: Colors.pink),
            ),
          if (isLoggedIn) AccountPage(),
        ],
      );
    });
  }
}
