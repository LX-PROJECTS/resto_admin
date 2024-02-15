import 'package:resto_admin/core/exception/base_exception.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

final class DeleteProductUsecase {
  final ProductRepository repository;
  DeleteProductUsecase({required this.repository});
  Future<void> call(String id) async {
    try {
      return await repository.deleteProductFromFirestore(id);
    } catch (e) {
      throw BaseException('Cannot delete product');
    }
  }
}
