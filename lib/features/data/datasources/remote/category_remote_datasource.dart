import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clean_archi_firebase/core/error/failure.dart';
import 'package:flutter_clean_archi_firebase/features/data/model/category_model.dart';


abstract class CategoryRemoteDataSource {
  Future<Either<Failure, void>> createCategory(CategoryModel category);
  Future<Either<Failure, CategoryModel?>> getCategoryById(String categoryId);
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
  Future<Either<Failure, void>> updateCategory(CategoryModel category);
  Future<Either<Failure, void>> deleteCategory(String categoryId);
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final FirebaseFirestore firestore;

  CategoryRemoteDataSourceImpl(this.firestore);

  @override
  Future<Either<Failure, void>> createCategory(CategoryModel category) async {
    try {
      await firestore.collection('categories').doc(category.categoryId).set(category.toJson());
      return Right(null); // Sucesso
    } catch (e) {
      return Left(ServerFailure('Failed to create category'));
    }
  }

  @override
  Future<Either<Failure, CategoryModel?>> getCategoryById(String categoryId) async {
    try {
      final doc = await firestore.collection('categories').doc(categoryId).get();
      if (doc.exists) {
        return Right(CategoryModel.fromDocument(doc));
      }
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch category by ID'));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      final querySnapshot = await firestore.collection('categories').get();
      final categories = querySnapshot.docs
          .map((doc) => CategoryModel.fromDocument(doc))
          .toList();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch categories'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(CategoryModel category) async {
    try {
      await firestore.collection('categories').doc(category.categoryId).update(category.toJson());
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update category'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(String categoryId) async {
    try {
      await firestore.collection('categories').doc(categoryId).delete();
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to delete category'));
    }
  }
}
