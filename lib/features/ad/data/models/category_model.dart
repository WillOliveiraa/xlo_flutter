import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final String? id;

  CategoryModel({required String description, this.id}) : super(description);

  factory CategoryModel.fromParse(ParseObject object) {
    return CategoryModel(
      id: object.objectId,
      description: object.get<String>(keyCategoryDescription) ?? '',
    );
  }
}
