import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/core/shared/utils/constants.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/components/field_title.dart';

import '../home_controller.dart';
import 'bar_button.dart';

class TopBar extends StatelessWidget {
  final HomeController homeController;

  const TopBar(this.homeController);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Observer(builder: (_) {
          return Expanded(
            child: AnimatedCard(
              direction: AnimatedCardDirection.left,
              child: BarButton(
                label: homeController.category?.description ?? 'Categorias',
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
                onTap: () {
                  showCategories(context);
                },
              ),
            ),
          );
        }),
        Expanded(
          child: AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: BarButton(
              label: 'Filtros',
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[400]!),
                  left: BorderSide(color: Colors.grey[400]!),
                ),
              ),
              onTap: () {
                Modular.to.pushNamed(
                    '$baseRouter$filterRouter'.replaceAll('//', '/'),
                    arguments: homeController.adFilter);
              },
            ),
          ),
        ),
      ],
    );
  }

  void showCategories(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Observer(builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FieldTitle(
                  title: adCategory,
                  subtitle: '',
                ),
                Expanded(
                  child: DropdownButton<CategoryModel>(
                    value: homeController.category,
                    onChanged: (value) {
                      Navigator.of(context).pop();
                      return homeController.setCategory(value);
                    },
                    items: homeController.categories
                        .map<DropdownMenuItem<CategoryModel>>(
                            (CategoryModel category) {
                      return DropdownMenuItem<CategoryModel>(
                        value: category,
                        child: Text(category.description),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
