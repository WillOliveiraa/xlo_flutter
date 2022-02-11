import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';

import 'ad_controller.dart';

class AdPage extends StatelessWidget {
  AdPage({Key? key}) : super(key: key);

  // AdModel adModel = AdModel(title: '', description: '', price: 0, images: []);

  @override
  Widget build(BuildContext context) {
    // final primaryColor = Theme.of(context).primaryColor;
    // final labelStyle = TextStyle(
    //   fontWeight: FontWeight.w800,
    //   color: Colors.grey,
    //   fontSize: 18,
    // );

    return Scaffold(
      appBar: AppBar(title: Text('Insert')),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<AdController>(builder: (_, adController, child) {
              return TextFormField(
                decoration: InputDecoration(
                  errorText: adController.titleError,
                ),
                onChanged: adController.setTitle,
                enabled: !adController.loading,
              );
            }),
            SizedBox(height: 10),
            Consumer<AdController>(builder: (_, adController, child) {
              return TextFormField(
                decoration: InputDecoration(
                  errorText: adController.descriptionError,
                ),
                onChanged: adController.setDescription,
                enabled: !adController.loading,
              );
            }),
            SizedBox(height: 10),
            Consumer<AdController>(builder: (_, adController, child) {
              return TextFormField(
                decoration: InputDecoration(
                  errorText: adController.priceError,
                ),
                keyboardType: TextInputType.number,
                onChanged: adController.setPrice,
                enabled: !adController.loading,
              );
            }),
            SizedBox(height: 20),
            Consumer<AdController>(builder: (_, adController, child) {
              return SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: adController.saveAdPressed as Function()?,
                  child: adController.loading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white))
                      : const Text('Salvar', style: TextStyle(fontSize: 18.0)),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
