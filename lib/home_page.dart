import 'package:flutter/material.dart';

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
      body: Center(
        child: TextButton(
          child: Text('Test'),
          onPressed: () {
            controller.saveAd();
          },
        ),
      ),
    );
  }
}
