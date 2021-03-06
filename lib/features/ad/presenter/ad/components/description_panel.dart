import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

class DescriptionPanel extends StatelessWidget {
  const DescriptionPanel(this.ad);

  final AdModel ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Text(
            'Descrição',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: ReadMoreText(
            ad.description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Ver descrição',
            trimExpandedText: '...menos',
            colorClickableText: Colors.purple,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
