import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../filter_controller.dart';
import 'price_field.dart';
import 'section_title.dart';

class PriceRangeField extends StatelessWidget {
  const PriceRangeField(this.filter);

  final FilterController filter;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Preço'),
        Row(
          children: [
            PriceField(
              label: 'Min',
              onChanged: filter.setMinPrice,
              initialValue:
                  filter.minPrice != null ? filter.minPrice.toString() : '',
            ),
            const SizedBox(width: 12),
            PriceField(
              label: 'Max',
              onChanged: filter.setMaxPrice,
              initialValue:
                  filter.maxPrice != null ? filter.maxPrice.toString() : '',
            ),
          ],
        ),
        Observer(builder: (_) {
          if (filter.priceError != null) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                filter.priceError!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            );
          }
          return Container();
        })
      ],
    );
  }
}
