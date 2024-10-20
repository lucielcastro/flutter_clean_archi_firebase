import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archi_firebase/core/error/failure.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, void>> createCategory(CategoryEntity category);
  Future<Either<Failure, CategoryEntity?>> getCategoryById(String categoryId);
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, void>> updateCategory(CategoryEntity category);
  Future<Either<Failure, void>> deleteCategory(String categoryId);
}
