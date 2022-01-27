import 'package:flutter/material.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';
import 'package:asuka/asuka.dart' as asuka;

class AdController extends ChangeNotifier {
  final SaveAdUseCaseImp _saveAdUseCase;

  AdController(this._saveAdUseCase);

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

  void setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  String? get descriptionError {
    if (_description == null || adModel.isValidDescription) {
      return null;
    } else if (_description!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  void setPrice(String value) {
    _price = num.tryParse(value);
    notifyListeners();
  }

  String? get priceError {
    if (_price == null || adModel.isValidPrice) {
      return null;
    } else if (_price! == 0) {
      return 'Campo obrigatório';
    } else {
      return 'Preço não pode ser zero';
    }
  }

  bool get isValid => adModel.isValidTitle && adModel.isValidDescription;

  Function? get saveAdPressed => isValid && !loading ? saveAd : null;

  Future<void> saveAd() async {
    loading = true;
    // await Future.delayed(Duration(seconds: 2));
    final response = await _saveAdUseCase(adModel);

    response.fold((failure) {
      asuka.showSnackBar(
          SnackBar(content: Text('Erro ao tentar salvar o anúncio')));
      loading = false;
    }, (_) {
      asuka.showSnackBar(SnackBar(content: Text('Anúncio salvo com sucesso!')));
      loading = false;
    });
  }
}
