import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:xlo_flutter/core/shared/utils/constants.dart';
import 'package:xlo_flutter/core/shared/widgets/button_default.dart';
import 'package:xlo_flutter/core/shared/widgets/circular_progress_ind_default.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/components/cep_field/cep_field.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/components/hide_phone_field.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/components/images_field.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/save_ad_controller.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/components/field_title.dart';

class SaveAdPage extends StatefulWidget {
  const SaveAdPage({this.ad});

  final AdModel? ad;

  @override
  State<SaveAdPage> createState() => _SaveAdPageState();
}

class _SaveAdPageState extends ModularState<SaveAdPage, SaveAdController> {
  NumberFormat numberFormat =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  bool alreadyUpdate = false;

  @override
  void initState() {
    super.initState();
    controller.getAllCategories();
    if (widget.ad != null) controller.initializeFields(widget.ad!);

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      if (widget.ad != null) alreadyUpdate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ad != null ? 'Editar Anúncio' : 'Inserir Anúncio'),
      ),
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
                  initialValue: widget.ad != null ? widget.ad?.title : '',
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
                  initialValue: widget.ad != null ? widget.ad?.description : '',
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
                if (controller.loadingCategories) {
                  return const Center(child: CircularProgressIndDefault());
                }

                return DropdownButton<CategoryModel>(
                  value: widget.ad != null && !alreadyUpdate
                      ? widget.ad!.category as CategoryModel
                      : controller.category,
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
              CepField(widget.ad != null && widget.ad!.isValidAddress
                  ? widget.ad?.address.cep
                  : null),
              const SizedBox(height: 10),
              HidePhoneField(controller),
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
                  initialValue: widget.ad != null
                      ? numberFormat.format(widget.ad?.price)
                      : '',
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
                return ButtonDefault(
                  onPressed: controller.saveAdPressed as Function()?,
                  child: controller.loading
                      ? const CircularProgressIndDefault(color: Colors.white)
                      : const Text(adSave, style: TextStyle(fontSize: 18.0)),
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
