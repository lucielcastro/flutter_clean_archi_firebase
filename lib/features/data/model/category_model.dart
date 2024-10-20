import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required String title,
    required String categoryId,
    required String image,
    String? description,
    required DateTime createdAt,
    bool isActive = true,
  }) : super(
          title: title,
          categoryId: categoryId,
          image: image,
          description: description,
          createdAt: createdAt,
          isActive: isActive,
        );

  // Conversão de entidade para JSON (para Firestore)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'categoryId': categoryId,
      'image': image,
      'description': description,
      'createdAt': createdAt,
      'isActive': isActive,
    };
  }

  // Conversão de JSON (Firestore) para entidade
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'] ?? '',
      categoryId: json['categoryId'] ?? '',
      image: json['image'] ?? '',
      description: json['description'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      isActive: json['isActive'] ?? true,
    );
  }

  // Criando a partir de DocumentSnapshot (Firestore)
  factory CategoryModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryModel.fromJson(data);
  }
}
