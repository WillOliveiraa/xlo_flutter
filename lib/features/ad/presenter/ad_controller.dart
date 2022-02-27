import 'package:brasil_fields/brasil_fields.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/pages/base/base_controller.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/models/address_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_categories_usecase/get_all_categories_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/features/ad/presenter/components/cep_field/cep_field_controller.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

part 'ad_controller.g.dart';

class AdController = _AdControllerBase with _$AdController;

abstract class _AdControllerBase with Store {
  final SaveAdUseCaseImp _saveAdUseCase;
  final GetAllCategoriesUseCaseImp _getAllCategoriesUseCase;
  final AuthController _authController;
  final BaseController _baseController;
  final CepFieldController _cepFieldController;

  _AdControllerBase(this._saveAdUseCase, this._getAllCategoriesUseCase,
      this._authController, this._baseController, this._cepFieldController);

  @observable
  String? _title;

  @observable
  String? _description;

  @observable
  num? _price;

  ObservableList<dynamic> _images = ObservableList();

  @observable
  bool _loading = false;

  @observable
  bool _loadingCategories = false;

  @observable
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  @observable
  CategoryModel? _category;

  CategoryModel? get category => _category;

  // AddressModel? _address;

  // AddressModel? get address => _address;

  // ignore: unnecessary_getters_setters
  bool get loading => _loading;

  set loading(bool value) => _loading = value;

  // ignore: unnecessary_getters_setters
  bool get loadingCategories => _loadingCategories;

  set loadingCategories(bool value) => _loadingCategories = value;

  @action
  void setCategory(CategoryModel? value) => _category = value;

  // ignore: unnecessary_getters_setters
  dynamic get images => _images;

  set images(dynamic value) => _images = value;

  @computed
  AdModel get adModel => AdModel.createAd(
        title: _title ?? '',
        description: _description ?? '',
        price: _price ?? 0,
        images: _images,
        category: _category ?? CategoryModel(description: ''),
        onwer: _getCurrentUser(),
        address: _cepFieldController.address ??
            AddressModel(
              uf: UfModel(initials: '', name: ''),
              city: CityModel(name: ''),
              cep: '',
              district: '',
            ),
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
  void setPrice(String value) =>
      _price = UtilBrasilFields.converterMoedaParaDouble(
          value == '' ? 'R\$ 0,00' : value);

  @computed
  String? get priceError {
    if (_price == null || adModel.isValidPrice) {
      return null;
    } else
      return 'Campo obrigatório';
  }

  @computed
  String? get categoryError {
    if (_category == null || adModel.isValidCategory)
      return null;
    else
      return 'Campo obrigatório';
  }

  @computed
  String? get imagesError {
    if (_images.length == 0 || adModel.isValidImages)
      return null;
    else
      return 'Insira images';
  }

  @computed
  bool get isValid =>
      adModel.isValidTitle &&
      adModel.isValidDescription &&
      adModel.isValidCategory &&
      adModel.isValidImages &&
      adModel.isValidOwner;

  @computed
  Function? get saveAdPressed => isValid && !loading ? saveAd : null;

  Future<void> saveAd() async {
    loading = true;
    final response = await _saveAdUseCase(adModel);

    response.fold((failure) {
      asuka.showSnackBar(
          SnackBar(content: Text('Erro ao tentar salvar o anúncio')));
      loading = false;
    }, (_) async {
      loading = false;
      asuka.showSnackBar(SnackBar(content: Text('Anúncio salvo com sucesso!')));
      await Future.delayed(Duration(seconds: 1));
      _baseController.setPage(0);
    });
  }

  @action
  Future<void> getAllCategories() async {
    loadingCategories = true;
    final response = await _getAllCategoriesUseCase();

    var result = response.fold((l) => l, (r) => r);

    if (result is List<CategoryModel>) {
      _categories = result;
      _categories.insert(0, CategoryModel(description: ''));
      // category = categories.first;
    } else
      print(result);

    loadingCategories = false;
  }

  UserModel _getCurrentUser() {
    if (_authController.user != null) return _authController.user!;

    return UserModel(name: 'name', email: 'email');
  }
}
