import 'package:flutter/material.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

class AdController extends ChangeNotifier {
  String? _title;
  String? _description;
  num? _price;
  List<dynamic> _images = [];

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  AdModel get adModel => AdModel.createAd(
        title: _title ?? '',
        description: _description ?? '',
        price: _price ?? 0,
        images: _images,
      );

  void setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  String? get titleError {
    if (_title == null || adModel.isValidTitle) {
      return null;
    } else if (_title!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  bool get isValid => adModel.isValidTitle;

  Function? get saveAdPressed => isValid && !loading ? saveAd : null;

  Future<void> saveAd() async {
    loading = true;
    await Future.delayed(Duration(seconds: 2));
    print(adModel);
    loading = false;
  }
}
