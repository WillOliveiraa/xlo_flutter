import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/utils/constants.dart';
import 'package:xlo_flutter/features/ad/presenter/ad_controller.dart';
import 'package:xlo_flutter/features/ad/presenter/components/cep_field/cep_field_controller.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/components/field_title.dart';

class CepField extends StatefulWidget {
  CepField(this.adController);

  final AdController adController;

  @override
  State<CepField> createState() => _CepFieldState();
}

class _CepFieldState extends ModularState<CepField, CepFieldController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FieldTitle(
          title: adCep,
          subtitle: adCepDesc,
        ),
        Observer(builder: (_) {
          return TextFormField(
            initialValue: controller.cep,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter()
            ],
            onChanged: controller.setCep,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              isDense: true,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.grey,
                // fontSize: 18,
              ),
              // errorText: controller.error,
            ),
          );
        }),
        const SizedBox(height: 10),
        Observer(builder: (_) {
          if (controller.address == null &&
              controller.error == null &&
              !controller.loading) {
            return Container();
          } else if (controller.address == null && controller.error == null) {
            return const LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.purple),
                backgroundColor: Colors.transparent);
          } else if (controller.error != null) {
            return Container(
              color: Colors.red.withAlpha(100),
              height: 50,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                controller.error!,
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
              ),
            );
          } else {
            final address = controller.address;

            return Container(
              color: Colors.purple.withAlpha(150),
              height: 50,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                'Localização: ${address!.district.isNotEmpty ? address.district + ' ' : ''}${address.city.name} - ${address.uf.initials}',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            );
          }
        }),
      ],
    );
  }
}
