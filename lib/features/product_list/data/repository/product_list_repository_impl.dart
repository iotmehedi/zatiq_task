import '../../../../../../core/source/model/api_response.dart';
import '../../domain/repository/product_list_repository.dart';
import '../model/product_list_model.dart';

class ProductListRepositoryImpl extends ProductListRepository {
  ProductListRepositoryImpl(super.productListService);

  @override
  Future<Response<ProductListModel>?> product({required String page}) async {
    Response<ProductListModel>? apiResponse;
    apiResponse = await productListService.product(page: page);
    return apiResponse;
  }
}
