import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_filter_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';
import 'package:xlo_flutter/features/home/presenter/home/home_controller.dart';

part 'filter_controller.g.dart';

class FilterController = _FilterControllerBase with _$FilterController;

abstract class _FilterControllerBase with Store {
  @observable
  OrderBy _orderBy = OrderBy.date;

  OrderBy get orderBy => _orderBy;

  @action
  void setOrderBy(OrderBy value) => _orderBy = value;

  @observable
  int? _minPrice;

  int? get minPrice => _minPrice;

  @observable
  int? _maxPrice;

  int? get maxPrice => _maxPrice;

  @action
  void setMinPrice(String value) =>
      _minPrice = int.tryParse(value.replaceAll('.', '').replaceAll('R\$', ''));

  @action
  void setMaxPrice(String value) =>
      _maxPrice = int.tryParse(value.replaceAll('.', '').replaceAll('R\$', ''));

  @computed
  String? get priceError =>
      _maxPrice != null && _minPrice != null && _maxPrice! < _minPrice!
          ? 'Faixa de preço inválida'
          : null;

  @observable
  int _vendorType = vendorTypeParticular;

  int get vendorType => _vendorType;

  @action
  void selectVendorType(int value) => _vendorType = value;

  @action
  void setVendorType(int type) => _vendorType = _vendorType | type;

  @action
  void resetVendorType(int type) => _vendorType = _vendorType & ~type;

  @computed
  bool get isTypeParticular => (_vendorType & vendorTypeParticular) != 0;

  @computed
  bool get isTypeProfessional => (_vendorType & vendorTypeProfessional) != 0;

  @computed
  bool get isFormValid => priceError == null;

  void save() {
    final HomeController homeController = Modular.get();
    homeController.setAdFilter(clone());
    homeController.getFilteredAds(loadMore: false);
  }

  @action
  void initializeFields(AdFilterEntity filter) {
    setOrderBy(filter.orderBy);
    setMinPrice(filter.minPrice.toString());
    setMaxPrice(filter.maxPrice.toString());
    _vendorType = filter.vendorType;
  }

  AdFilterModel clone() {
    return AdFilterModel(
      orderBy: _orderBy,
      minPrice: _minPrice,
      maxPrice: _maxPrice,
      vendorType: _vendorType,
    );
  }
}
