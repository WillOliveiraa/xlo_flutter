import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/widgets/circular_progress_ind_default.dart';
import 'package:xlo_flutter/core/shared/widgets/empty_card.dart';
import 'package:xlo_flutter/features/ad/presenter/my_favorite_ads/components/ad_list_tile.dart';
import 'package:xlo_flutter/features/ad/presenter/my_favorite_ads/my_favorite_ads_controller.dart';

class MyFavoriteAdsPage extends StatefulWidget {
  const MyFavoriteAdsPage({Key? key}) : super(key: key);

  @override
  State<MyFavoriteAdsPage> createState() => _MyFavoriteAdsPageState();
}

class _MyFavoriteAdsPageState
    extends ModularState<MyFavoriteAdsPage, MyFavoriteAdsController> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 900));
      controller.getMyFavoriteAds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Favoritos')),
      // drawer: CustomDrawer(),
      body: Observer(builder: (_) {
        if (controller.loading) {
          return const Center(child: CircularProgressIndDefault());
        }

        if (controller.myFavoriteAds.isEmpty) {
          return const EmptyCard('Você não possui nenhum anúncio favorito.');
        }

        return RefreshIndicator(
          color: Theme.of(context).primaryColor,
          onRefresh: () => controller.refresh(),
          child: ListView.builder(
            itemCount: controller.myFavoriteAds.length,
            itemBuilder: (_, index) {
              final favorite = controller.myFavoriteAds[index];
              return AdListTile(ad: favorite);
            },
          ),
        );
      }),
    );
  }
}
