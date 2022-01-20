import 'package:flutter/material.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';

import 'test_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TestController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: TextButton(
          child: Text('Test'),
          onPressed: () {
            // controller.saveAd();
            controller.getAllAds();
          },
        ),
      ),
    );
  }
}
