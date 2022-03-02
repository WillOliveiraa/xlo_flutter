import 'dart:io';

import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:path/path.dart' as path;
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/parse_errors.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_save_ad.dart';

class SaveAdDatasourceImp implements SaveAdDatasource {
  @override
  Future<Either<Failure, Unit>> saveAd(AdEntity adEntity) async {
    final _parseUser = await ParseUser.currentUser() as ParseUser;
    final _parseObject = ParseObject(keyAdTable);
    final ad = _parseObject;

    final parseImages = await _saveImages(adEntity.images);

    final parseAcl = ParseACL(owner: _parseUser);
    parseAcl.setPublicReadAccess(allowed: true);
    parseAcl.setPublicWriteAccess(allowed: false);
    _parseObject.setACL(parseAcl);

    _parseObject
      ..set<String>(keyAdTitle, adEntity.title)
      ..set<String>(keyAdDescription, adEntity.description)
      ..set<num>(keyAdPrice, adEntity.price)
      ..set<int>(keyAdStatus, adEntity.status.index)
      ..set<ParseObject>(
          keyAdCategory,
          ParseObject(keyCategoryTable)
            ..set(keyCategoryId, adEntity.category.id))
      ..set<String>(keyAdDistrict, adEntity.address.district)
      ..set<String>(keyAdCity, adEntity.address.city.name)
      ..set<String>(keyAdFederativeUnit, adEntity.address.uf.initials)
      ..set<String>(keyAdPostalCode, adEntity.address.cep)
      ..set<List<ParseFile>>(keyAdImages, parseImages)
      ..set<ParseUser>(keyAdOwner, _parseUser);

    final result = await ad.save();

    if (result.success)
      return Right(unit);
    else
      return Left(ErrorSaveAd());
  }

  Future<List<ParseFile>> _saveImages(List images) async {
    final parseImages = <ParseFile>[];

    try {
      for (final image in images) {
        if (image is File) {
          final parseFile = ParseFile(image, name: path.basename(image.path));
          final response = await parseFile.save();

          if (!response.success) {
            return Future.error(
                ParseErrors.getDescription(response.error!.code));
          }

          parseImages.add(parseFile);
        } else {
          final parseFile = ParseFile(null);
          parseFile.name = path.basename(image as String);
          parseFile.url = image;

          parseImages.add(parseFile);
        }
      }

      return parseImages;
    } catch (e) {
      return Future.error('Falha ao salvar imagens');
    }
  }
}
