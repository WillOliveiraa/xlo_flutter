class CategoryEntity {
  final String? id;
  final String description;

  CategoryEntity({required this.description, this.id});

  bool get isValidDescription =>
      description.isNotEmpty && description.length > 10;
}
