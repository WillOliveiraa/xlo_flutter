class CategoryEntity {
  final String description;

  CategoryEntity(this.description);

  bool get isValidDescription =>
      description.isNotEmpty && description.length > 10;
}
