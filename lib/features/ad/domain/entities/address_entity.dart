import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';

class AddressEntity {
  AddressEntity({
    required this.uf,
    required this.city,
    required this.cep,
    required this.district,
  });

  UfEntity uf;
  final CityEntity city;

  final String cep;
  final String district;
}
