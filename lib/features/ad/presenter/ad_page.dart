import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_flutter/features/ad/presenter/ad_controller.dart';

class AdPage extends StatefulWidget {
  AdPage({Key? key}) : super(key: key);

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends ModularState<AdPage, AdController> {
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
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  errorText: controller.titleError,
                ),
                onChanged: controller.setTitle,
                enabled: !controller.loading,
              );
            }),
            SizedBox(height: 10),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  errorText: controller.descriptionError,
                ),
                onChanged: controller.setDescription,
                enabled: !controller.loading,
              );
            }),
            SizedBox(height: 10),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  errorText: controller.priceError,
                ),
                keyboardType: TextInputType.number,
                onChanged: controller.setPrice,
                enabled: !controller.loading,
              );
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: controller.saveAdPressed as Function()?,
                  child: controller.loading
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
