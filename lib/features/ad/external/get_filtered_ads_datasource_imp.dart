import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/errors/parse_errors.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_filtered_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_filtered_ads.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

class GetFilteredAdsDatasourceImp implements GetFilteredAdsDatasource {
  @override
  Future<Either<Failure, List<AdModel>>> getFilteredAds(
      {required AdFilterEntity filter,
      String? search,
      CategoryEntity? category,
      required int page}) async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));

    queryBuilder.includeObject([keyAdOwner, keyAdCategory]);

    queryBuilder.setAmountToSkip(page * 7);
    queryBuilder.setLimit(7);
    queryBuilder.whereEqualTo(keyAdStatus, AdStatus.active.index);

    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyAdTitle, search);
    }

    if (category != null && category.id != '*') {
      queryBuilder.whereEqualTo(
        keyAdCategory,
        (ParseObject(keyCategoryTable)..set(keyCategoryId, category.id))
            .toPointer(),
      ); // referencia o ponteiro da tabela Ad chamado category
    }

    switch (filter.orderBy) {
      case OrderBy.price:
        queryBuilder.orderByAscending(keyAdPrice);
        break;
      case OrderBy.date:
      default:
        queryBuilder.orderByDescending(keyAdCreatedAt);
        break;
    }

    if (filter.minPrice != null && filter.minPrice! > 0) {
      queryBuilder.whereGreaterThanOrEqualsTo(keyAdPrice, filter.minPrice);
    }
    if (filter.maxPrice != null && filter.maxPrice! > 0) {
      queryBuilder.whereLessThanOrEqualTo(keyAdPrice, filter.maxPrice);
    }

    if (filter.vendorType > 0 &&
        filter.vendorType < (vendorTypeProfessional | vendorTypeParticular)) {
      final userQuery = QueryBuilder<ParseUser>(ParseUser.forQuery());

      if (filter.vendorType == vendorTypeParticular) {
        userQuery.whereEqualTo(keyUserType, UserType.particular.index);
      }
      if (filter.vendorType == vendorTypeProfessional) {
        userQuery.whereEqualTo(keyUserType, UserType.professional.index);
      }

      queryBuilder.whereMatchesQuery(keyAdOwner, userQuery);
    }

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return Right(response.results!
          .map((parseObj) => AdModel.fromParse(parseObj as ParseObject))
          .toList());
    } else if (response.success && response.results == null) {
      return const Right([]);
    } else {
      return Left(ErrorGetFilteredAds(
          message: ParseErrors.getDescription(response.error!.code)));
    }
  }
}
