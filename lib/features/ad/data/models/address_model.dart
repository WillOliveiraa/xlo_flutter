import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required UfModel uf,
    required CityModel city,
    required String cep,
    required String district,
  }) : super(uf: uf, city: city, cep: cep, district: district);

  factory AddressModel.fromMap(Map<dynamic, dynamic> map) {
    return AddressModel(
      uf: UfModel(initials: map['uf'] as String, name: ''),
      city: CityModel(name: map['localidade'] as String),
      cep: map['cep']! as String,
      district: map['bairro']! as String,
    );
  }
}
