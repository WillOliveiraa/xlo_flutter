import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../save_ad_controller.dart';

class HidePhoneField extends StatelessWidget {
  HidePhoneField(this.adController);

  final SaveAdController adController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: () {
          adController.setHidePhone(!adController.hidePhone!);
        },
        child: Row(
          children: [
            Observer(builder: (_) {
              return Checkbox(
                value: adController.hidePhone,
                onChanged: adController.setHidePhone,
                activeColor: Theme.of(context).primaryColor,
              );
            }),
            const Flexible(child: Text('Ocultar o meu telefone neste anúncio'))
          ],
        ),
      ),
    );
  }
}
