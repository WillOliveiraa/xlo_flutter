import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({int? id, required String name}) : super(id: id, name: name);

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }
}
