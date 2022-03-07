import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';

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
          return BarButton(
            label: homeController.category?.description ?? 'Categorias',
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[400]!),
              ),
            ),
            onTap: () async {
              // final category =
              //     await Navigator.of(context).push(MaterialPageRoute(
              //   builder: (_) => CategoryScreen(
              //     showAll: true,
              //     selected: homeController.category,
              //   ),
              // ));
              // if (category != null)
              //   homeController.setCategory(category as Category);
            },
          );
        }),
        BarButton(
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
      ],
    );
  }
}
