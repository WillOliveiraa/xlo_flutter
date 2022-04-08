import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/shared/helpers/extensions.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

class PendingTile extends StatelessWidget {
  PendingTile(this.ad);

  final AdModel ad;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Modular.to.pushNamed('$baseRouter$adRouter', arguments: ad);
          },
          child: Container(
            height: 80,
            child: Row(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.network(
                    ad.images.isEmpty
                        ? "https://static.thenounproject.com/png/194055-200.png"
                        : ad.images[0].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          ad.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          ad.price.formattedMoney(),
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: Colors.orange,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'AGUARDANDO PUBLICAÇÃO',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
