import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/helpers/extensions.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/core/shared/widgets/button_default.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/presenter/my_ads/my_ads_controller.dart';

class ActiveTile extends StatelessWidget {
  ActiveTile({required this.ad, required this.controller});

  final AdModel ad;
  final MyAdsController controller;

  final List<MenuChoice> choices = [
    MenuChoice(index: 0, title: 'Editar', iconData: Icons.edit),
    MenuChoice(index: 1, title: 'Já vendi', iconData: Icons.thumb_up),
    MenuChoice(index: 2, title: 'Excluir', iconData: Icons.delete)
  ];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return AnimatedCard(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Modular.to.pushNamed('$baseRouter$adRouter', arguments: ad);
            },
            child: SizedBox(
              height: 80,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Hero(
                      tag: ad.id!,
                      child: Image.network(
                        ad.images.isEmpty
                            ? 'https://static.thenounproject.com/png/194055-200.png'
                            : ad.images.first.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ad.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            ad.price.formattedMoney(),
                            style: const TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '${ad.views} visitas',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Hero(tag: 'activeImg2', child: Icon(Icons.add)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PopupMenuButton<MenuChoice>(
                        onSelected: (choice) {
                          switch (choice.index) {
                            case 0:
                              editAd(context);
                              break;
                            case 1:
                              soldAd(context);
                              break;
                            case 2:
                              deleteAd(context);
                              break;
                          }
                        },
                        icon: Icon(
                          Icons.more_vert,
                          size: 22,
                          color: color,
                        ),
                        itemBuilder: (_) {
                          return choices
                              .map(
                                (choice) => PopupMenuItem<MenuChoice>(
                                  value: choice,
                                  child: Row(
                                    children: [
                                      Icon(
                                        choice.iconData,
                                        size: 20,
                                        color: color,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        choice.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: color,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editAd(BuildContext context) async {
    final success = await Modular.to.pushNamed(
        '$baseRouter$saveAdRouter'.replaceAll('//', '/'),
        arguments: ad);

    if (success != null && success as bool) controller.refresh();
  }

  void soldAd(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Vendido'),
        content: Text('Confirmar a venda de ${ad.title}?'),
        actions: [
          ButtonDefault(
            onPressed: () => Navigator.pop(_),
            primaryColor: Colors.white,
            secondColor: Colors.black87,
            child: const Text('Não'),
          ),
          ButtonDefault(
            onPressed: () {
              Navigator.pop(_);
              controller.soldAd(ad);
            },
            secondColor: Colors.red,
            primaryColor: Colors.white,
            child: const Text('Sim'),
          ),
        ],
      ),
    );
  }

  void deleteAd(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Excluir'),
        content: Text('Confirmar a exclusão de ${ad.title}?'),
        actions: [
          ButtonDefault(
            onPressed: () => Navigator.pop(_),
            primaryColor: Colors.white,
            secondColor: Colors.black87,
            child: const Text('Não'),
          ),
          ButtonDefault(
            onPressed: () {
              controller.deleteAd(ad);
              Navigator.pop(_);
            },
            secondColor: Colors.red,
            primaryColor: Colors.white,
            child: const Text('Sim'),
          ),
        ],
      ),
    );
  }
}

class MenuChoice {
  MenuChoice({
    required this.index,
    required this.title,
    required this.iconData,
  });

  final int index;
  final String title;
  final IconData iconData;
}
