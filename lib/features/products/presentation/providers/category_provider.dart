import 'package:resto_admin/features/products/data/repository/category_repository_impl.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';
import 'package:resto_admin/features/products/domain/usecases/add_category_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/delete_category_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/update_category_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
class Category extends _$Category {
  late CategoryRepository repository;
  @override
  void build() {
    repository = ref.watch(categoryRepositoryProvider);
  }

  Future<void> add(
      {required String id,
      required String imagePath,
      required String name}) async {
    await AddCategoryUseCase(repository: repository)(
      id: id,
      imagePath: imagePath,
      name: name,
    );
  }

  Future<void> remove({required String id}) async {
    await DeleteCategoryUseCase(repository: repository)(id: id);
  }

  Future<void> update(
      {required String id,
      required String imagePath,
      required String name}) async {
    await UpdateCategoryUseCase(repository: repository)(
      id: id,
      imagePath: imagePath,
      name: name,
    );
  }

  Stream<List<CategoryEntity>> getAll() {
    return repository.getAll();
  }
}