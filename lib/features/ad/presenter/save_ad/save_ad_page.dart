import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_flutter/core/shared/utils/constants.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/save_ad_controller.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/components/images_field.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/components/field_title.dart';

import 'components/cep_field/cep_field.dart';

class SaveAdPage extends StatefulWidget {
  @override
  State<SaveAdPage> createState() => _SaveAdPageState();
}

class _SaveAdPageState extends ModularState<SaveAdPage, SaveAdController> {
  @override
  void initState() {
    super.initState();
    controller.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserir Anúncio', style: TextStyle(color: Colors.black87)),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImagesField(controller),
              const SizedBox(height: 10),
              const FieldTitle(
                title: adTitle,
                subtitle: adTitleDesc,
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
                title: adDescription,
                subtitle: adDescriptionDesc,
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
              const FieldTitle(
                title: adCategory,
                subtitle: adCategoryDesc,
              ),
              Observer(builder: (_) {
                return DropdownButton<CategoryModel>(
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
                );
              }),
              const SizedBox(height: 10),
              CepField(controller),
              const SizedBox(height: 10),
              const FieldTitle(
                title: adPrice,
                subtitle: adPriceDesc,
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
                    CentavosInputFormatter(moeda: true)
                  ],
                );
              }),
              const SizedBox(height: 20),
              Observer(builder: (_) {
                return SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: controller.saveAdPressed as Function()?,
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    child: controller.loading
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white))
                        : const Text(adSave, style: TextStyle(fontSize: 18.0)),
                  ),
                );
              }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
