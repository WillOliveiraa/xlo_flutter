import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 900));
      context.read<HomeController>().getAllAds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text('Home')),
      body: Consumer<HomeController>(builder: (_, homeController, child) {
        return ListView.builder(
          itemCount: homeController.ads.length,
          itemBuilder: (_, index) {
            final ad = homeController.ads[index];
            return ListTile(title: Text(ad.title));
          },
        );
      }),
    );
  }
}
