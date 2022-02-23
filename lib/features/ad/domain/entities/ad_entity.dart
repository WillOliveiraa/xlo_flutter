import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

import 'address_entity.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class AdEntity {
  final String title;
  final String description;
  final num price;
  final int? views;
  final List images;
  final AdStatus status;
  final CategoryEntity category;
  final UserEntity owner;
  final AddressEntity address;
  final bool? hidePhone;
  final DateTime? createdAt;

  AdEntity({
    required this.title,
    required this.description,
    required this.price,
    this.views = 0,
    required this.images,
    this.status = AdStatus.PENDING,
    required this.category,
    required this.owner,
    required this.address,
    this.hidePhone = false,
    this.createdAt,
  });

  bool get isValidTitle => title.isNotEmpty && title.length > 6;

  bool get isValidDescription =>
      description.isNotEmpty && description.length > 10;

  bool get isValidPrice => price > 0;

  bool get isValidImages => images.isNotEmpty;

  bool get isValidCategory => category.description.isNotEmpty;

  bool get isValidOwner => owner.id != null;

  bool get isValidAddress =>
      address.cep.isNotEmpty || address.city.name.isNotEmpty;

  set title(String value) => title = value;
}
