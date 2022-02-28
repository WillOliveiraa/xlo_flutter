import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xlo_flutter/core/shared/components/circular_progress_ind_default.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_flutter/core/shared/helpers/money_formatter.dart';
import 'package:xlo_flutter/core/shared/utils/constants.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 900));
      controller.checkIfNeedToUpdateList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(headerBegin, style: TextStyle(color: Colors.black87)),
      ),
      body: Observer(builder: (_) {
        if (controller.loading)
          return Center(child: CircularProgressIndDefault());

        return RefreshIndicator(
          color: Theme.of(context).primaryColor,
          onRefresh: () => controller.getAllAds(),
          child: ListView.builder(
            itemCount: controller.ads.length,
            itemBuilder: (_, index) {
              final ad = controller.ads[index];
              return ListTile(
                onTap: () {
                  print(controller.category);
                },
                leading: Container(
                  height: double.infinity,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.grey[300],
                    child: ad.images.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: Image.network(
                              ad.images.first.toString(),
                              fit: BoxFit.cover,
                            ),
                          )
                        : SvgPicture.asset('assets/icons/User.svg'),
                  ),
                ),
                title: Text(
                  ad.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  ad.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CustomMoneyFormatter.formattedMoney(ad.price),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
