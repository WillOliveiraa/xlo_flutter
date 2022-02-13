import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/base/base_controller.dart';
import 'package:xlo_flutter/core/shared/utils/constants.dart';

import 'page_tile.dart';

class PageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final baseController = Modular.get<BaseController>();
    return Column(
      children: [
        PageTile(
          label: headerAds,
          iconData: Icons.list,
          onTap: () => baseController.setPage(0),
          highlighted: baseController.page == 0,
        ),
        PageTile(
          label: headerInsertAd,
          iconData: Icons.edit,
          onTap: () => baseController.setPage(1),
          highlighted: baseController.page == 1,
        ),
        PageTile(
          label: headerChat,
          iconData: Icons.chat,
          onTap: () => baseController.setPage(2),
          highlighted: baseController.page == 2,
        ),
        PageTile(
          label: headerFavorites,
          iconData: Icons.favorite,
          onTap: () => baseController.setPage(3),
          highlighted: baseController.page == 3,
        ),
        PageTile(
          label: headerMyAccount,
          iconData: Icons.person,
          onTap: () => baseController.setPage(4),
          highlighted: baseController.page == 4,
        ),
      ],
    );
  }
}
