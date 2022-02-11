import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'ad_controller.g.dart';

class AdController = _AdControllerBase with _$AdController;

abstract class _AdControllerBase with Store {
  final SaveAdUseCaseImp _saveAdUseCase;

  _AdControllerBase(this._saveAdUseCase);

  @observable
  String? _title;

  @observable
  String? _description;

  @observable
  num? _price;

  @observable
  List<dynamic> _images = [];

  @observable
  bool _loading = false;

  // ignore: unnecessary_getters_setters
  bool get loading => _loading;

  set loading(bool value) => _loading = value;

  @computed
  AdModel get adModel => AdModel.createAd(
        title: _title ?? '',
        description: _description ?? '',
        price: _price ?? 0,
        images: _images,
      );

  @action
  void setTitle(String value) => _title = value;

  @computed
  String? get titleError {
    if (_title == null || adModel.isValidTitle) {
      return null;
    } else if (_title!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  @action
  void setDescription(String value) => _description = value;

  @computed
  String? get descriptionError {
    if (_description == null || adModel.isValidDescription) {
      return null;
    } else if (_description!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  @action
  void setPrice(String value) => _price = num.tryParse(value);

  @computed
  String? get priceError {
    if (_price == null || adModel.isValidPrice) {
      return null;
    } else if (_price! == 0) {
      return 'Campo obrigatório';
    } else {
      return 'Preço não pode ser zero';
    }
  }

  @computed
  bool get isValid => adModel.isValidTitle && adModel.isValidDescription;

  @computed
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
