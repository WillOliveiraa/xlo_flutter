import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/features/ad/data/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

class AdModel extends AdEntity {
  final String? id;

  AdModel({
    this.id,
    required String title,
    required String description,
    required num price,
    int? views,
    required List<dynamic> images,
  }) : super(
          title: title,
          description: description,
          price: price,
          views: views,
          images: images,
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

  factory AdModel.fromMap(Map<String, dynamic> map) {
    return AdModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? 0,
      views: map['views']?.toInt(),
      images: List.from(map['images']),
    );
  }

  factory AdModel.fromParse(ParseObject object) {
    return AdModel(
      id: object.objectId,
      title: object.get<String>(keyAdTitle) ?? '',
      description: object.get<String>(keyAdDescription) ?? '',
      images: [],
      price: object.get<num>(keyAdPrice) ?? 0,
      // createdAt: object.createdAt,
      views: object.get<int>(keyAdViews, defaultValue: 0),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdModel.fromJson(String source) =>
      AdModel.fromMap(json.decode(source));
}
