import 'dart:convert';

import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

class AdModel extends AdEntity {
  AdModel({
    required String title,
    required String description,
    required double price,
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

  String toJson() => json.encode(toMap());

  factory AdModel.fromJson(String source) =>
      AdModel.fromMap(json.decode(source));
}
