import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';

class UfModel extends UfEntity {
  UfModel({int? id, required String initials, required String name})
      : super(id: id, initials: initials, name: name);

  factory UfModel.fromJson(Map<String, dynamic> json) => UfModel(
        id: json['id'] as int,
        initials: json['sigla'] as String,
        name: json['nome'] as String,
      );

  @override
  String toString() {
    return 'Uf{id: $id, name: $name}';
  }
}
