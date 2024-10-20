class CategoryEntity {
  final String title;
  final String categoryId;
  final String image;
  final String? description;
  final DateTime createdAt;
  final bool isActive;

  CategoryEntity({
    required this.title,
    required this.categoryId,
    required this.image,
    this.description,
    required this.createdAt,
    this.isActive = true,
  });
}
