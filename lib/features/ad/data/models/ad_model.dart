import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/models/address_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

class AdModel extends AdEntity {
  AdModel({
    String? id,
    required String title,
    required String description,
    required num price,
    required AdStatus status,
    int? views,
    required List<dynamic> images,
    required CategoryModel category,
    required UserModel owner,
    required AddressModel address,
    final bool? hidePhone,
    final DateTime? createdAt,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          status: status,
          views: views,
          images: images,
          category: category,
          owner: owner,
          address: address,
          hidePhone: hidePhone,
          createdAt: createdAt,
        );

  factory AdModel.createAd({
    String? id,
    required String title,
    required String description,
    required num price,
    required AdStatus status,
    int? views = 0,
    required List<dynamic> images,
    required CategoryModel category,
    required UserModel onwer,
    required AddressModel address,
    final bool? hidePhone,
    final DateTime? createdAt,
  }) {
    return AdModel(
      id: id,
      title: title,
      description: description,
      price: price,
      status: status,
      images: images,
      views: views,
      category: category,
      owner: onwer,
      address: address,
      hidePhone: hidePhone,
      createdAt: createdAt,
    );
  }

  factory AdModel.fromParse(ParseObject object) {
    return AdModel(
      id: object.objectId,
      title: object.get<String>(keyAdTitle) ?? '',
      description: object.get<String>(keyAdDescription) ?? '',
      status: AdStatus.values[object.get<int>(keyAdStatus)!],
      images: object
              .get<List>(keyAdImages)
              ?.map((e) => (e as ParseFile).url)
              .toList() ??
          [],
      price: object.get<num>(keyAdPrice) ?? 0,
      views: object.get<int>(keyAdViews, defaultValue: 0),
      category: CategoryModel.fromParse(object.get<ParseObject>(keyAdCategory)),
      owner: UserModel.fromParseAd(object.get<ParseUser>(keyAdOwner)!),
      address: AddressModel(
        district: object.get<String>(keyAdDistrict) ?? '',
        city: CityModel(name: object.get<String>(keyAdCity) ?? ''),
        cep: object.get<String>(keyAdPostalCode) ?? '',
        uf: UfModel(
          initials: object.get<String>(keyAdFederativeUnit) ?? '',
          name: object.get<String>(keyAdUfName) ?? '',
        ),
      ),
      hidePhone: object.get<bool>(keyAdHidePhone),
      createdAt: object.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'views': views,
      'images': images,
    };
  }

  @override
  String toString() {
    return '''AdModel(id: $id, title: $title, description: $description, price: $price, status: $status, views: $views, images: $images, category: $category, owner: $owner, address: $address)''';
  }
}
