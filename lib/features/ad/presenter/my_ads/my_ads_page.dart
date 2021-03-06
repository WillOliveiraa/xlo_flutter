import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/widgets/circular_progress_ind_default.dart';
import 'package:xlo_flutter/core/shared/widgets/empty_card.dart';
import 'package:xlo_flutter/features/ad/presenter/my_ads/components/active_tile.dart';
import 'package:xlo_flutter/features/ad/presenter/my_ads/components/pending_tile.dart';
import 'package:xlo_flutter/features/ad/presenter/my_ads/components/sold_tile.dart';
import 'package:xlo_flutter/features/ad/presenter/my_ads/my_ads_controller.dart';

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
        title: const Text('Meus Anúncios'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: color,
          tabs: const [
            Tab(child: Text('ATIVOS', style: TextStyle(color: Colors.black87))),
            Tab(
                child:
                    Text('PENDENTES', style: TextStyle(color: Colors.black87))),
            Tab(
                child:
                    Text('VENDIDOS', style: TextStyle(color: Colors.black87))),
          ],
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.loading) {
          return const Center(child: CircularProgressIndDefault());
        }

        return TabBarView(
          controller: tabController,
          children: [
            Observer(builder: (_) {
              if (controller.activeAds.isEmpty) {
                return const EmptyCard('Você não possui nenhum anúncio ativo.');
              }

              return RefreshIndicator(
                color: Theme.of(context).primaryColor,
                onRefresh: () => controller.refresh(),
                child: ListView.builder(
                  itemCount: controller.activeAds.length,
                  itemBuilder: (_, index) {
                    return ActiveTile(
                        ad: controller.activeAds[index],
                        controller: controller);
                  },
                ),
              );
            }),
            Observer(builder: (_) {
              if (controller.pendingAds.isEmpty) {
                return const EmptyCard(
                    'Você não possui nenhum anúncio pendente.');
              }

              return RefreshIndicator(
                color: Theme.of(context).primaryColor,
                onRefresh: () => controller.refresh(),
                child: ListView.builder(
                  itemCount: controller.pendingAds.length,
                  itemBuilder: (_, index) {
                    return PendingTile(controller.pendingAds[index]);
                  },
                ),
              );
            }),
            Observer(builder: (_) {
              if (controller.soldAds.isEmpty) {
                return const EmptyCard(
                    'Você não possui nenhum anúncio vendido.');
              }

              return RefreshIndicator(
                color: Theme.of(context).primaryColor,
                onRefresh: () => controller.refresh(),
                child: ListView.builder(
                  itemCount: controller.soldAds.length,
                  itemBuilder: (_, index) {
                    return SoldTile(
                        ad: controller.soldAds[index], controller: controller);
                  },
                ),
              );
            }),
          ],
        );
      }),
    );
  }
}
