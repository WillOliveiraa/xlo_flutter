import 'dart:io';

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/presenter/ad/ad_controller.dart';
import 'package:xlo_flutter/features/ad/presenter/my_favorite_ads/my_favorite_ads_controller.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/save_ad_controller.dart';

import 'components/bottom_bar.dart';
import 'components/description_panel.dart';
import 'components/location_panel.dart';
import 'components/main_panel.dart';
import 'components/user_panel.dart';

// ignore: must_be_immutable
class AdPage extends StatefulWidget {
  AdPage(this.ad);

  AdModel ad;

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends ModularState<AdPage, AdController> {
  final AuthController authController = Modular.get();
  final SaveAdController saveAdController = Modular.get();
  final MyFavoriteAdsController favoriteController = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.updateViews(widget.ad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Anúncio'),
        actions: [
          if (widget.ad.owner.id == authController.user?.id)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                Modular.to.pushNamed(
                  '$baseRouter$saveAdRouter'.replaceAll('//', '/'),
                  arguments: widget.ad,
                );
              },
            ),
          if (widget.ad.status == AdStatus.ACTIVE && authController.isLoggedIn)
            Observer(builder: (_) {
              return IconButton(
                icon: Icon(favoriteController.checkIsFavorite(widget.ad.id!)
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () async {
                  favoriteController.toggleFavorite(widget.ad);
                },
              );
            }),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (saveAdController.isUpdateAd) widget.ad = saveAdController.adModel;

          return Stack(
            children: [
              ListView(
                children: [
                  Container(
                    height: 280,
                    child: Carousel(
                      images: widget.ad.images
                          .map(
                            (url) => url is String
                                ? Image.network(
                                    url,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    url as File,
                                    fit: BoxFit.cover,
                                  ),
                          )
                          .toList(),
                      dotSize: 4,
                      dotBgColor: Colors.transparent,
                      dotColor: Colors.orange,
                      autoplay: false,
                      dotSpacing: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MainPanel(widget.ad),
                        Divider(color: Colors.grey[300]),
                        DescriptionPanel(widget.ad),
                        Divider(color: Colors.grey[300]),
                        LocationPanel(widget.ad),
                        Divider(color: Colors.grey[300]),
                        UserPanel(widget.ad),
                        SizedBox(
                            height: widget.ad.status == AdStatus.PENDING
                                ? 16
                                : 120),
                      ],
                    ),
                  ),
                ],
              ),
              BottomBar(widget.ad),
            ],
          );
        },
      ),
    );
  }
}
