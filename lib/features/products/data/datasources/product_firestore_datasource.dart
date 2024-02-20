import 'package:resto_admin/features/products/data/models/product_model.dart';

abstract class ProductFireStoreDataSource {
  Future<void> add(ProductModel model);
  Future<void> remove(String id);
  Stream<List<ProductModel>> getAll(String categoryId);
   Future<void> update(ProductModel updatedModel);
  Future<ProductModel> getById(String id);
}
