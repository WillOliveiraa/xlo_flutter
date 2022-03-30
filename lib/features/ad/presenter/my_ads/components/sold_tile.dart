import 'package:flutter/material.dart';
import 'package:xlo_flutter/core/shared/helpers/extensions.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

class SoldTile extends StatelessWidget {
  SoldTile(this.ad);

  final AdModel ad;
  // final MyAdsStore store;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Container(
        height: 80,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                ad.images.isEmpty
                    ? 'https://static.thenounproject.com/png/194055-200.png'
                    : ad.images.first.toString(),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ad.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      ad.price.formattedMoney(),
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  iconSize: 20,
                  color: Colors.purple,
                  onPressed: () {
                    // store.deleteAd(ad);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
