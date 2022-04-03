import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/widgets/circular_progress_ind_default.dart';
import 'package:xlo_flutter/core/shared/widgets/empty_card.dart';
import 'package:xlo_flutter/features/ad/presenter/my_ads/my_ads_controller.dart';

import 'components/active_tile.dart';
import 'components/pending_tile.dart';
import 'components/sold_tile.dart';

class MyAdsPage extends StatefulWidget {
  const MyAdsPage({this.initialPage = 0});

  final int initialPage;

  @override
  _MyAdsPageState createState() => _MyAdsPageState();
}

class _MyAdsPageState extends ModularState<MyAdsPage, MyAdsController>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    controller.getMyAds();

    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Anúncios'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: color,
          tabs: [
            Tab(child: Text('ATIVOS', style: TextStyle(color: color))),
            Tab(child: Text('PENDENTES', style: TextStyle(color: color))),
            Tab(child: Text('VENDIDOS', style: TextStyle(color: color))),
          ],
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.loading)
          return Center(child: CircularProgressIndDefault());

        return TabBarView(
          controller: tabController,
          children: [
            Observer(builder: (_) {
              if (controller.activeAds.isEmpty)
                return EmptyCard('Você não possui nenhum anúncio ativo.');

              return ListView.builder(
                itemCount: controller.activeAds.length,
                itemBuilder: (_, index) {
                  return ActiveTile(
                      ad: controller.activeAds[index], controller: controller);
                },
              );
            }),
            Observer(builder: (_) {
              if (controller.pendingAds.isEmpty)
                return EmptyCard('Você não possui nenhum anúncio pendente.');

              return ListView.builder(
                itemCount: controller.pendingAds.length,
                itemBuilder: (_, index) {
                  return PendingTile(controller.pendingAds[index]);
                },
              );
            }),
            Observer(builder: (_) {
              if (controller.soldAds.isEmpty)
                return EmptyCard('Você não possui nenhum anúncio vendido.');

              return ListView.builder(
                itemCount: controller.soldAds.length,
                itemBuilder: (_, index) {
                  return SoldTile(
                      ad: controller.soldAds[index], controller: controller);
                },
              );
            }),
          ],
        );
      }),
    );
  }
}
