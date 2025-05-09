import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../features/product_list/data/repository/product_list_repository_impl.dart';
import '../../features/product_list/data/source/product_list_service.dart';
import '../../features/product_list/domain/repository/product_list_repository.dart';
import '../../features/product_list/presentation/controller/product_list_controller.dart';
import '../source/dio_client.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<Dio>(
      () => Dio()..interceptors.add(InterceptorsWrapper()));
  locator.registerFactory<DioClient>(() => DioClient(locator<Dio>()));

  //product
  locator.registerFactory<ProductListController>(() => Get.put(ProductListController()));
  locator.registerFactory<ProductListService>(() => ProductListService());
  locator.registerFactory<ProductListRepository>(
      () => ProductListRepositoryImpl(locator<ProductListService>()));


}
