import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/shared/widgets/circular_progress_ind_default.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_flutter/core/shared/widgets/empty_card.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/core/shared/utils/constants.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/save_ad_controller.dart';
import 'package:xlo_flutter/features/home/presenter/home/components/ad_tile.dart';

import 'components/create_ad_button.dart';
import 'components/search_dialog.dart';
import 'components/top_bar.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with AutomaticKeepAliveClientMixin {
  final SaveAdController saveAdController = Modular.get();
  final authController = Modular.get<AuthController>();
  final ScrollController scrollController = ScrollController();

  var _overlayIsVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 900));
      controller.checkIfNeedToUpdateList(false);
    });
  }

  void openSearch(BuildContext context) async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(
        currentSearch: controller.search,
      ),
    );
    if (search != null) controller.setSeach(search as String);
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Observer(builder: (_) {
          if (controller.search.isEmpty) {
            return Text(headerBegin);
          }

          return GestureDetector(
            onTap: () => openSearch(context),
            child: LayoutBuilder(builder: (_, constraints) {
              return Container(
                width: constraints.biggest.width,
                child: Text(controller.search),
              );
            }),
          );
        }),
        actions: [
          Observer(
            builder: (_) {
              if (controller.search.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => openSearch(context),
                );
              }
              return IconButton(
                icon: Icon(Icons.close),
                onPressed: () => controller.setSeach(''),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              if (authController.isLoggedIn) {
                Modular.to.pushNamed(
                  '$baseRouter$saveAdRouter'.replaceAll('//', '/'),
                );
              } else
                Modular.to.pushNamed(signInRouter);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TopBar(controller),
          Expanded(
            child: Stack(
              children: [
                Observer(builder: (_) {
                  final filteredAds = controller.filteredAds;

                  if (controller.loading)
                    return Center(child: CircularProgressIndDefault());

                  if (saveAdController.isUpdateAd)
                    updateItemFromList(
                        controller.ads, saveAdController.adModel);

                  if (!controller.loading && filteredAds.isEmpty)
                    return EmptyCard('Humm... Nenhum anúncio encontrado!');

                  return RefreshIndicator(
                    color: Theme.of(context).primaryColor,
                    onRefresh: () => controller.refreshAds(),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: controller.itemCount,
                      itemBuilder: (_, index) {
                        if (index == controller.ads.length &&
                            !controller.lastPage) {
                          controller.checkIfNeedToUpdateList(true);

                          return Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: CircularProgressIndDefault(),
                            ),
                          );
                        }

                        final ad = filteredAds[index];

                        return AnimatedCard(
                          direction: AnimatedCardDirection.left,
                          initDelay: Duration(milliseconds: 600),
                          child: AdTile(ad),
                        );
                      },
                    ),
                  );
                }),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: CreateAdButton(scrollController),
                ),
                IgnorePointer(
                  child: AnimatedOpacity(
                    opacity: _overlayIsVisible ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x00000000),
                              Theme.of(context).primaryColor
                            ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateItemFromList(List<AdModel> ads, AdModel adModel) {
    final index = ads.indexWhere((item) => item.id == adModel.id);

    if (index > 0)
      ads[index] = adModel;
    else
      ads.insert(0, adModel);
  }

  @override
  bool get wantKeepAlive => true;
}
