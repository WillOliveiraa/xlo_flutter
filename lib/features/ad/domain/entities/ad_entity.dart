import 'package:equatable/equatable.dart';

class AdEntity extends Equatable {
  final String title;
  final String description;
  final num price;
  final int? views;
  final List images;

  AdEntity({
    required this.title,
    required this.description,
    required this.price,
    this.views,
    required this.images,
  });

  @override
  List<Object> get props => [images];
}
