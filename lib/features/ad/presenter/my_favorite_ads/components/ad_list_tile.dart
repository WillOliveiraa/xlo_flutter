import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xlo_flutter/core/shared/helpers/money_formatter.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

class AdListTile extends StatelessWidget {
  const AdListTile({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final AdModel ad;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Modular.to.pushNamed('$baseRouter$adRouter', arguments: ad);
      },
      leading: Container(
        height: double.infinity,
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.grey[300],
          child: ad.images.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: ad.images.first is String
                      ? Image.network(
                          ad.images.first,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          ad.images.first as File,
                          fit: BoxFit.cover,
                        ),
                )
              : SvgPicture.asset('assets/icons/User.svg'),
        ),
      ),
      title: Text(
        ad.title,
        style: TextStyle(fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
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
  }
}
