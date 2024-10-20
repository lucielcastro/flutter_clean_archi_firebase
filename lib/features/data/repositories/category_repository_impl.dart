import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archi_firebase/core/error/failure.dart';
import 'package:flutter_clean_archi_firebase/features/data/datasources/remote/category_remote_datasource.dart';
import 'package:flutter_clean_archi_firebase/features/data/model/category_model.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> createCategory(CategoryEntity category) async {
    final model = CategoryModel(
      title: category.title,
      categoryId: category.categoryId,
      image: category.image,
      description: category.description,
      createdAt: category.createdAt,
      isActive: category.isActive,
    );
    return await remoteDataSource.createCategory(model);
  }

  @override
  Future<Either<Failure, CategoryEntity?>> getCategoryById(String categoryId) async {
    final result = await remoteDataSource.getCategoryById(categoryId);
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    final result = await remoteDataSource.getAllCategories();
    return result.fold(
      (failure) => Left(failure),
      (models) => Right(models),
    );
  }

  @override
  Future<Either<Failure, void>> updateCategory(CategoryEntity category) async {
    final model = CategoryModel(
      title: category.title,
      categoryId: category.categoryId,
      image: category.image,
      description: category.description,
      createdAt: category.createdAt,
      isActive: category.isActive,
    );
    return await remoteDataSource.updateCategory(model);
  }

  @override
  Future<Either<Failure, void>> deleteCategory(String categoryId) async {
    return await remoteDataSource.deleteCategory(categoryId);
  }
}
