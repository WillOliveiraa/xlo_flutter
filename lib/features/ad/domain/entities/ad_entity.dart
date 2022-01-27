import 'package:equatable/equatable.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class AdEntity extends Equatable {
  final String title;
  final String description;
  final num price;
  final int? views;
  final List images;
  final AdStatus status;

  AdEntity({
    required this.title,
    required this.description,
    required this.price,
    this.views = 0,
    required this.images,
    this.status = AdStatus.PENDING,
  });

  bool get isValidTitle => title.isNotEmpty && title.length > 6;

  bool get isValidDescription =>
      description.isNotEmpty && description.length > 10;

  bool get isValidPrice => price > 0;

  bool get isValidImages => images.isNotEmpty;

  set title(String value) => title = value;

  @override
  List<Object> get props => [images];
}
