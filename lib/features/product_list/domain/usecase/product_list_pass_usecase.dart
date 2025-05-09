import '../../../../../../core/source/model/api_response.dart';
import '../../data/model/product_list_model.dart';
import 'product_list_usecase.dart';

class ProductListPassUseCase extends ProductListUseCase {
  ProductListPassUseCase(super.productListRepository);

  Future<Response<ProductListModel>?> call({required String page}) async {
    var response = await productListRepository.product(page: page);
    return response;
  }
}
