import '../repository/product_list_repository.dart';

abstract class ProductListUseCase {
  final ProductListRepository productListRepository;

  ProductListUseCase(this.productListRepository);
}

