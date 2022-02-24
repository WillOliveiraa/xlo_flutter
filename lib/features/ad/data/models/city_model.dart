import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({int? id, required String name}) : super(id: id, name: name);

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json['id'] as int,
        name: json['nome'] as String,
      );

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }
}
