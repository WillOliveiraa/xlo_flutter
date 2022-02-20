import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class AdEntity {
  final String title;
  final String description;
  final num price;
  final int? views;
  final List images;
  final AdStatus status;
  final CategoryEntity category;

  AdEntity({
    required this.title,
    required this.description,
    required this.price,
    this.views = 0,
    required this.images,
    this.status = AdStatus.PENDING,
    required this.category,
  });

  bool get isValidTitle => title.isNotEmpty && title.length > 6;

  bool get isValidDescription =>
      description.isNotEmpty && description.length > 10;

  bool get isValidPrice => price > 0;

  bool get isValidImages => images.isNotEmpty;

  bool get isValidCategory => category.description.isNotEmpty;

  set title(String value) => title = value;
}
