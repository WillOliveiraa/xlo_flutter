import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';
import 'package:xlo_flutter/features/home/presenter/filter/components/section_title.dart';
import 'package:xlo_flutter/features/home/presenter/filter/filter_controller.dart';

class VendorTypeField extends StatelessWidget {
  const VendorTypeField(this.filter);

  final FilterController filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionTitle('Tipo de anunciante'),
        Observer(builder: (_) {
          return Wrap(
            runSpacing: 5,
            children: [
              GestureDetector(
                onTap: () {
                  if (filter.isTypeParticular) {
                    if (filter.isTypeProfessional) {
                      filter.resetVendorType(vendorTypeParticular);
                    } else {
                      filter.selectVendorType(vendorTypeProfessional);
                    }
                  } else {
                    filter.setVendorType(vendorTypeParticular);
                  }
                },
                child: Container(
                  height: 50,
                  width: 130,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: filter.isTypeParticular
                        ? Colors.purple
                        : Colors.transparent,
                    border: Border.all(
                      color:
                          filter.isTypeParticular ? Colors.purple : Colors.grey,
                    ),
                  ),
                  child: Text(
                    'Particular',
                    style: TextStyle(
                      color:
                          filter.isTypeParticular ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  if (filter.isTypeProfessional) {
                    if (filter.isTypeParticular) {
                      filter.resetVendorType(vendorTypeProfessional);
                    } else {
                      filter.selectVendorType(vendorTypeParticular);
                    }
                  } else {
                    filter.setVendorType(vendorTypeProfessional);
                  }
                },
                child: Container(
                  height: 50,
                  width: 130,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: filter.isTypeProfessional
                        ? Colors.purple
                        : Colors.transparent,
                    border: Border.all(
                      color: filter.isTypeProfessional
                          ? Colors.purple
                          : Colors.grey,
                    ),
                  ),
                  child: Text(
                    'Profissional',
                    style: TextStyle(
                      color: filter.isTypeProfessional
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}
