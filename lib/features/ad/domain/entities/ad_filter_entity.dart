enum OrderBy { DATE, PRICE }

const VENDOR_TYPE_PARTICULAR = 1 << 0; // 1 deslocado em 0
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class AdFilterEntity {
  AdFilterEntity({
    this.orderBy = OrderBy.DATE,
    this.minPrice,
    this.maxPrice,
    this.vendorType = VENDOR_TYPE_PARTICULAR,
  });

  final OrderBy orderBy;
  final int? minPrice;
  final int? maxPrice;
  final int vendorType;
}
