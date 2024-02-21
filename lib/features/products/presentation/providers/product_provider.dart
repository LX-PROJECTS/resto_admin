import 'package:resto_admin/features/products/data/repository/product_repository_impl.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';
import 'package:resto_admin/features/products/domain/usecases/add_product_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/get_product_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/update_product_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class Product extends _$Product {
  late ProductRepository repository;

  @override
  List<ProductEntity> build() {
    repository = ref.read(productRepositoryProvider);
    return [];
  }

  Future<void> addProduct({
    required String name,
    required String description,
    required String imagePath,
    required String id,
    required List<ProductTypeEntity> types,
    required List<ProductAddOnEntity> addOns,
    required String categoryId,
  }) {
    repository = ref.read(productRepositoryProvider);
    return AddProductUsecase(repository: repository)(
        categoryId: categoryId,
        addOns: addOns,
        types: types,
        id: id,
        name: name,
        description: description,
        imagePath: imagePath);
  }

  Future<void> deleteProduct(String id) {
    final repository = ref.read(productRepositoryProvider);
    return DeleteProductUsecase(repository: repository)(id);
  }

  Future<void> updateProduct({
    required String name,
    required String description,
    required String imagePath,
    required String id,
    required List<ProductTypeEntity> types,
    required List<ProductAddOnEntity> addOns,
    required String categoryId,
  }) {
    repository = ref.watch(productRepositoryProvider);
    return UpdatedProductUseCase(repository: repository)(
        categoryId: categoryId,
        addOns: addOns,
        types: types,
        id: id,
        name: name,
        description: description,
        imagePath: imagePath);
  }

  Stream<List<ProductEntity>> getAll(String categoryId) {
    return GetAllProductsUseCase(repository: repository)(categoryId);
  }
}
