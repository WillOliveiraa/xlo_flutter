import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/presenter/ad_controller.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/components/field_title.dart';

class AdPage extends StatefulWidget {
  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends ModularState<AdPage, AdController> {
  @override
  void initState() {
    super.initState();
    controller.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Insert')),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FieldTitle(
              title: 'Título',
              subtitle: 'Título do anúncio.',
            ),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  isDense: true,
                  errorText: controller.titleError,
                ),
                onChanged: controller.setTitle,
                enabled: !controller.loading,
              );
            }),
            const SizedBox(height: 10),
            const FieldTitle(
              title: 'Descrição',
              subtitle: 'Escreva a descrição completa do anúncio.',
            ),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  isDense: true,
                  errorText: controller.descriptionError,
                ),
                onChanged: controller.setDescription,
                enabled: !controller.loading,
              );
            }),
            const SizedBox(height: 10),
            Observer(builder: (_) {
              return Center(
                child: DropdownButton<CategoryModel>(
                  value: controller.category,
                  onChanged: (value) => controller.setCategory(value),
                  items: controller.categories
                      .map<DropdownMenuItem<CategoryModel>>(
                          (CategoryModel category) {
                    return DropdownMenuItem<CategoryModel>(
                      value: category,
                      child: Text(category.description),
                    );
                  }).toList(),
                ),
              );
            }),
            const SizedBox(height: 10),
            const FieldTitle(
              title: 'Preço',
              subtitle: 'Preço do anúncio.',
            ),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  isDense: true,
                  errorText: controller.priceError,
                ),
                keyboardType: TextInputType.number,
                onChanged: controller.setPrice,
                enabled: !controller.loading,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(moeda: true)
                ],
              );
            }),
            const SizedBox(height: 20),
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
