import '../../../../../../core/source/model/api_response.dart';
import '../../data/model/product_list_model.dart';
import '../../data/source/product_list_service.dart';

abstract class ProductListRepository {
  final ProductListService productListService;

  ProductListRepository(this.productListService);

  Future<Response<ProductListModel>?> product({required String page});
}
