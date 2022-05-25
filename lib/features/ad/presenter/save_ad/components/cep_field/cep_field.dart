import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/utils/constants.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/components/cep_field/cep_field_controller.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/components/field_title.dart';

class CepField extends StatefulWidget {
  const CepField(this.initializeCEP);

  final String? initializeCEP;

  @override
  State<CepField> createState() => _CepFieldState();
}

class _CepFieldState extends ModularState<CepField, CepFieldController> {
  @override
  void initState() {
    super.initState();
    if (widget.initializeCEP != null) controller.setInitializeField(true);
  }

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
            initialValue: widget.initializeCEP ?? controller.cep,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter()
            ],
            onChanged: controller.setCep,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.grey,
              ),
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
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.red),
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
                '''Localização: ${address!.district.isNotEmpty ? '${address.district} ' : ''}${address.city.name} - ${address.uf.initials}''',
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            );
          }
        }),
      ],
    );
  }
}
