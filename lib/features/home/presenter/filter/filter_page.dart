import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/widgets/button_default.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_filter_model.dart';
import 'package:xlo_flutter/features/home/presenter/filter/filter_controller.dart';

import 'components/order_by_filter.dart';
import 'components/price_range_field.dart';
import 'components/vendor_type_field.dart';

class FilterPage extends StatefulWidget {
  const FilterPage(this.filter);

  final AdFilterModel filter;
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends ModularState<FilterPage, FilterController> {
  @override
  void initState() {
    super.initState();
    controller.initializeFields(widget.filter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar Busca'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderByFilter(controller),
                  PriceRangeField(controller),
                  VendorTypeField(controller),
                  Observer(builder: (_) {
                    return Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: ButtonDefault(
                        primaryColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          'Filtrar',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        onPressed: controller.isFormValid
                            ? () {
                                controller.save();
                                Navigator.of(context).pop();
                              }
                            : null,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
