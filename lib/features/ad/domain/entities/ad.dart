import 'package:equatable/equatable.dart';

class Ad extends Equatable {
  final String title;
  final String description;
  final num price;
  final int views;
  final List images;

  Ad({this.title, this.description, this.price, this.views, this.images});

  @override
  List<Object> get props => [images];
}
