import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/features/ad/data/models/address_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/fetch_by_cep_usecase/fetch_by_cep_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ufs_usecase/get_all_ufs_usecase.dart';

part 'cep_field_controller.g.dart';

class CepFieldController = _CepFieldControllerBase with _$CepFieldController;

abstract class _CepFieldControllerBase with Store {
  final FetchByCepUseCaseImp _fetchByCepUsecase;
  final GetAllUfsUseCaseImp _getAllUfsUseCase;

  _CepFieldControllerBase(this._fetchByCepUsecase, this._getAllUfsUseCase) {
    autorun((_) {
      if (clearCep.length != 8)
        _reset();
      else if (!_isInitialize) _searchCep();
    });
  }

  @observable
  String? _cep;

  String? get cep => _cep;

  @observable
  AddressModel? _address;

  // ignore: unnecessary_getters_setters
  AddressModel? get address => _address;

  setAddress(AddressModel? value) => _address = value;

  @observable
  String? _error;

  String? get error => _error;

  @observable
  bool _loading = false;

  bool get loading => _loading;

  bool _isInitialize = false;

  bool setInitializeField(bool value) => _isInitialize = value;

  @action
  void setCep(String value) => _cep = value;

  @computed
  String get clearCep =>
      _cep != null ? _cep!.replaceAll(RegExp('[^0-9]'), '') : '';

  @computed
  bool get isValid => _cep!.length >= 8;

  @action
  Future<void> _searchCep() async {
    _loading = true;
    final response = await _fetchByCepUsecase(clearCep);

    response.fold((failure) {
      _error = failure.message;
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      _loading = false;
    }, (address) async {
      _address = address as AddressModel;
      getAllUfs();
    });
  }

  Future<void> getAllUfs() async {
    final response = await _getAllUfsUseCase();

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      _loading = false;
    }, (ufs) async {
      _address!.uf =
          ufs.firstWhere((uf) => uf.initials == _address?.uf.initials);
      _loading = false;
      asuka.showSnackBar(SnackBar(content: Text('CEP buscado com sucesso!')));
    });
  }

  @action
  void _reset() {
    _error = null;
    _loading = false;
  }
}
