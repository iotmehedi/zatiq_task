import '../../../../../../core/source/dio_client.dart';
import '../../../../../../core/source/model/api_response.dart';
import '../../../../core/app_component/app_component.dart';
import '../../../../core/network/configuration.dart';
import '../model/product_list_model.dart';

class ProductListService {
  final DioClient _dioClient = locator<DioClient>();
  Future<Response<ProductListModel>?> product({required String page}) async {
    Response<ProductListModel>? apiResponse;
    await _dioClient.get(
      path: "${NetworkConfiguration.productList}?page=$page",
      responseCallback: (response, message) {
        var products = ProductListModel.fromJson(response);
        apiResponse = Response.success(products);
      },
      failureCallback: (message, status) {
        print("this is message error $message $status");
        apiResponse = Response.error(message, status);
      },
    );

    return apiResponse;
  }
}
