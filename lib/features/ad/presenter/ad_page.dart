import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';
// import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

import 'ad_controller.dart';

class AdPage extends StatelessWidget {
  AdPage({Key? key}) : super(key: key);

  // AdModel adModel = AdModel(title: '', description: '', price: 0, images: []);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final adController = AdController();
    // final primaryColor = Theme.of(context).primaryColor;
    // final labelStyle = TextStyle(
    //   fontWeight: FontWeight.w800,
    //   color: Colors.grey,
    //   fontSize: 18,
    // );

    return ChangeNotifierProvider.value(
      value: adController,
      child: Scaffold(
        appBar: AppBar(title: Text('Insert')),
        drawer: CustomDrawer(),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              // TextFormField(
              //   initialValue: adModel.title,
              //   decoration: InputDecoration(
              //     labelText: 'Título *',
              //     labelStyle: labelStyle,
              //     // contentPadding: contentPadding,
              //     // errorText: adModel.titleError,
              //   ),
              //   // onChanged: adModel.setTitle,
              //   // validator: (value) {
              //   //   adModel.title = value!;
              //   //   if (adModel.isValidTitle) return 'asdasd';
              //   //   return null;
              //   // },
              //   onSaved: (value) => adModel.title = value!,
              // ),
              Consumer<AdController>(builder: (_, adController, child) {
                return TextFormField(
                  decoration: InputDecoration(
                    errorText: adController.titleError,
                  ),
                  onChanged: adController.setTitle,
                );
              }),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: adController.saveAdPressed as Function()?,
                  // onPressed: () async {
                  //   if (formKey.currentState!.validate()) {
                  //     formKey.currentState!.save();

                  //     // print(adModel.title);
                  //     // await product.save();

                  //     // context.read<ProductManager>().update(product);

                  //     // Navigator.of(context).pop();
                  //   }
                  // },
                  // style: ButtonStyle(textStyle: ),
                  // textColor: Colors.white,
                  // color: primaryColor,
                  // disabledColor: primaryColor.withAlpha(100),
                  child:
                      // product.loading
                      //     ? const CircularProgressIndicator(
                      //         valueColor: AlwaysStoppedAnimation(Colors.white))
                      // :
                      const Text('Salvar', style: TextStyle(fontSize: 18.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
