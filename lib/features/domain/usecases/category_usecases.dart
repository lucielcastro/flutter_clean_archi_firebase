import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archi_firebase/core/error/failure.dart';
import 'package:flutter_clean_archi_firebase/features/domain/entities/category_entity.dart';
import 'package:flutter_clean_archi_firebase/features/domain/repositories/category_repository.dart';

class CreateCategoryUseCase {
  final CategoryRepository repository;

  CreateCategoryUseCase(this.repository);

  Future<Either<Failure, void>> call(CategoryEntity category) {
    return repository.createCategory(category);
  }
}

class GetCategoryByIdUseCase {
  final CategoryRepository repository;

  GetCategoryByIdUseCase(this.repository);

  Future<Either<Failure, CategoryEntity?>> call(String categoryId) {
    return repository.getCategoryById(categoryId);
  }
}
class GetAllCategoriesUseCase {
  final CategoryRepository repository;

  GetAllCategoriesUseCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return repository.getAllCategories();
  }
}
class UpdateCategoryUseCase {
  final CategoryRepository repository;

  UpdateCategoryUseCase(this.repository);

  Future<Either<Failure, void>> call(CategoryEntity category) {
    return repository.updateCategory(category);
  }
}

class DeleteCategoryUseCase {
  final CategoryRepository repository;

  DeleteCategoryUseCase(this.repository);

  Future<Either<Failure, void>> call(String categoryId) {
    return repository.deleteCategory(categoryId);
  }
}
//BLOC
// final createCategoryUseCase = CreateCategoryUseCase(categoryRepository);

// final result = await createCategoryUseCase.call(categoryEntity);

// result.fold(
//   (failure) => print('Falha: ${failure.message}'),
//   (_) => print('Categoria criada com sucesso!'),
// );
