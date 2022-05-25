import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/update_ad_views_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_update_ad_views.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/update_ad_views_repository.dart';

class UpdateAdViewsRepositoryImp implements UpdateAdViewsRepository {
  UpdateAdViewsRepositoryImp(this._datasource);

  final UpdateAdViewsDatasource _datasource;

  @override
  Future<Either<Failure, Unit>> updateAdViews(
      {required String adId, required int views}) async {
    try {
      return await _datasource.updateAdViews(adId: adId, views: views);
    } catch (e) {
      return Left(ErrorUpdateAdViews());
    }
  }
}
