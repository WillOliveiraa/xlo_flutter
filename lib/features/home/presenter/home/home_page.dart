import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 900));
      controller.getAllAds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text('Home')),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: controller.ads.length,
          itemBuilder: (_, index) {
            final ad = controller.ads[index];
            return ListTile(
              title: Text(ad.title),
              subtitle: Text(ad.description),
              trailing: Text(ad.price.toString()),
            );
          },
        );
      }),
    );
  }
}
