import 'city_entity.dart';
import 'uf_entity.dart';

class AddressEntity {
  final UfEntity uf;
  final CityEntity city;

  final String cep;
  final String district;

  AddressEntity({
    required this.uf,
    required this.city,
    required this.cep,
    required this.district,
  });
}
