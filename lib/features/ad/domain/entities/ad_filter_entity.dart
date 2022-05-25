enum OrderBy { date, price }

const vendorTypeParticular = 1 << 0; // 1 deslocado em 0
const vendorTypeProfessional = 1 << 1;

class AdFilterEntity {
  AdFilterEntity(
      {this.orderBy = OrderBy.date,
      this.minPrice,
      this.maxPrice,
      this.vendorType = vendorTypeParticular});

  final OrderBy orderBy;
  final int? minPrice;
  final int? maxPrice;
  final int vendorType;
}
