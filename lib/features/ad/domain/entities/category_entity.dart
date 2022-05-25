class CategoryEntity {
  CategoryEntity({required this.description, this.id});

  final String? id;
  final String description;

  bool get isValidDescription =>
      description.isNotEmpty && description.length > 10;
}
