import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';

class AdFilterModel extends AdFilterEntity {
  AdFilterModel({
    required OrderBy orderBy,
    int? minPrice,
    int? maxPrice,
    required int vendorType,
  }) : super(
          orderBy: orderBy,
          minPrice: minPrice,
          maxPrice: maxPrice,
          vendorType: vendorType,
        );
}
