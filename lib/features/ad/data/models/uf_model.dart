import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';

class UfModel extends UfEntity {
  UfModel({int? id, required String initials, required String name})
      : super(id: id, initials: initials, name: name);

  @override
  String toString() {
    return 'Uf{id: $id, name: $name}';
  }
}
