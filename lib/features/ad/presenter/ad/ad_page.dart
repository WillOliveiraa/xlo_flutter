import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

import 'components/bottom_bar.dart';
import 'components/description_panel.dart';
import 'components/location_panel.dart';
import 'components/main_panel.dart';
import 'components/user_panel.dart';

class AdPage extends StatelessWidget {
  AdPage(this.ad);

  final AdModel ad;
  final AuthController authController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Anúncio'),
        actions: [
          if (ad.owner.id == authController.user?.id)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                Modular.to.pushNamed(
                  '$baseRouter$saveAdRouter'.replaceAll('//', '/'),
                  arguments: ad,
                );
              },
            ),
          Container(),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 280,
                child: Carousel(
                  images: ad.images
                      .map((url) => Image.network(url, fit: BoxFit.cover))
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
                    MainPanel(ad),
                    Divider(color: Colors.grey[300]),
                    DescriptionPanel(ad),
                    Divider(color: Colors.grey[300]),
                    LocationPanel(ad),
                    Divider(color: Colors.grey[300]),
                    UserPanel(ad),
                    SizedBox(height: ad.status == AdStatus.PENDING ? 16 : 120),
                  ],
                ),
              ),
            ],
          ),
          BottomBar(ad),
        ],
      ),
    );
  }
}
