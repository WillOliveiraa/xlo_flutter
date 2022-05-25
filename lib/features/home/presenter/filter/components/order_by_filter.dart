import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';
import 'package:xlo_flutter/features/home/presenter/filter/components/section_title.dart';
import 'package:xlo_flutter/features/home/presenter/filter/filter_controller.dart';

class OrderByFilter extends StatelessWidget {
  const OrderByFilter(this.filter);

  final FilterController filter;

  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title, OrderBy option) {
      return GestureDetector(
        onTap: () {
          filter.setOrderBy(option);
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:
                filter.orderBy == option ? Colors.purple : Colors.transparent,
            border: Border.all(
              color: filter.orderBy == option ? Colors.purple : Colors.grey,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: filter.orderBy == option ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Ordenar por'),
        Observer(builder: (_) {
          return Row(
            children: [
              buildOption('Data', OrderBy.date),
              const SizedBox(width: 12),
              buildOption('Preço', OrderBy.price),
            ],
          );
        })
      ],
    );
  }
}
