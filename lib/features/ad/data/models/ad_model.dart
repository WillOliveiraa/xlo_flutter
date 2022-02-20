import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

import 'category_model.dart';

class AdModel extends AdEntity {
  final String? id;

  AdModel({
    this.id,
    required String title,
    required String description,
    required num price,
    int? views,
    required List<dynamic> images,
    required CategoryModel category,
  }) : super(
          title: title,
          description: description,
          price: price,
          views: views,
          images: images,
          category: category,
        );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'views': views,
      'images': images,
    };
  }

  factory AdModel.createAd({
    required String title,
    required String description,
    required num price,
    int? views = 0,
    required List<dynamic> images,
    required CategoryModel category,
  }) {
    return AdModel(
      title: title,
      description: description,
      price: price,
      images: images,
      views: views,
      category: category,
    );
  }

  factory AdModel.fromParse(ParseObject object) {
    return AdModel(
      id: object.objectId,
      title: object.get<String>(keyAdTitle) ?? '',
      description: object.get<String>(keyAdDescription) ?? '',
      images: [],
      price: object.get<num>(keyAdPrice) ?? 0,
      views: object.get<int>(keyAdViews, defaultValue: 0),
      category: CategoryModel.fromParse(object.get<ParseObject>(keyAdCategory)),
    );
  }

  @override
  String toString() {
    return 'AdModel(title: $title, description: $description, price: $price, views: $views, images: $images, category: $category)';
  }
}
