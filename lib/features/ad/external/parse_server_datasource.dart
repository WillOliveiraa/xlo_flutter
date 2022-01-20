import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

class ParseServerDatasource implements GetAllAdsDatasource {
  final ParseObject _parseObject;

  ParseServerDatasource(this._parseObject);

  @override
  Future<Either<Failure, List<AdModel>?>> getAllAds() {
    // TODO: implement getAllAds
    throw UnimplementedError();
  }
}
