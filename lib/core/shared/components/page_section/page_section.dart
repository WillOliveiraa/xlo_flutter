import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/pages/base/base_controller.dart';
import 'package:xlo_flutter/core/shared/utils/constants.dart';

import 'page_tile.dart';

class PageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final baseController = Modular.get<BaseController>();
    final authController = Modular.get<AuthController>();

    return Observer(builder: (_) {
      final isLoggedIn = authController.isLoggedIn;
      return Column(
        children: [
          PageTile(
            label: headerAds,
            iconData: Icons.list,
            onTap: () => baseController.setPage(0),
            highlighted: baseController.page == 0,
          ),
          PageTile(
            label: headerChat,
            iconData: Icons.chat,
            onTap: () => baseController.setPage(1),
            highlighted: baseController.page == 1,
          ),
          if (isLoggedIn)
            PageTile(
              label: headerMyAccount,
              iconData: Icons.person,
              onTap: () => baseController.setPage(2),
              highlighted: baseController.page == 2,
            ),
        ],
      );
    });
  }
}
