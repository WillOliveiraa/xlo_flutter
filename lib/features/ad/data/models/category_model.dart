import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required String description, String? id})
      : super(description: description, id: id);

  factory CategoryModel.fromParse(ParseObject? object) {
    if (object != null) {
      return CategoryModel(
        id: object.objectId,
        description: object.get<String>(keyCategoryDescription) ?? '',
      );
    }
    return CategoryModel(description: '');
  }

  @override
  String toString() => 'CategoryModel(description: $description)';
}
