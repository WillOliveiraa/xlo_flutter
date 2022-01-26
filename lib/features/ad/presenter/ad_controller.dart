import 'package:flutter/material.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

class AdController extends ChangeNotifier {
  String? title;
  String? description;
  num? price;
  List<dynamic> images = [];

  AdModel get adModel => AdModel.createAd(
        title: title ?? '',
        description: description ?? '',
        price: price ?? 0,
        images: images,
      );

  void setTitle(String value) {
    title = value;
    notifyListeners();
  }

  String? get titleError {
    if (title == null || adModel.isValidTitle) {
      return null;
    } else if (title!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Titulo muito curto';
    }
  }

  bool get isValid => adModel.isValidTitle;

  Function? get saveAdPressed => isValid ? saveAd : null;

  Future<void> saveAd() async {
    print(adModel.title);
  }
}
