import 'package:xlo_flutter/features/ad/domain/entities/address_entity.dart';

import 'city_model.dart';
import 'uf_model.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required UfModel uf,
    required CityModel city,
    required String cep,
    required String district,
  }) : super(uf: uf, city: city, cep: cep, district: district);
}
