import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_component/app_component.dart';
import '../../../../main.dart';
import '../../data/model/product_list_model.dart';
import '../../domain/repository/product_list_repository.dart';
import '../../domain/usecase/product_list_pass_usecase.dart';

class ProductListController extends GetxController {
  var productListModel = ProductListModel().obs;
  var productSearchController = TextEditingController().obs;
  var isProductIsLoading = false.obs;
  var isProductIsMoreLoading = false.obs;
  var productListData = <ProductListData>[].obs;
  var productListFilteredList = <ProductListData>[].obs;
  @override
  void onInit() {
    productListFunc(page: "1");
    super.onInit();
  }
  productListFunc({required String page}) async {
    if(page == "1"){
    isProductIsLoading.value = true;
    }
    try {
      ProductListPassUseCase recommendedListPassUseCase =
          ProductListPassUseCase(locator<ProductListRepository>());
      var response = await recommendedListPassUseCase(page: page);
      if (response?.data != null) {
        productListModel.value = response?.data ?? ProductListModel();
        if(page == "1"){
          productListData.clear();
        }
        productListData.addAll(productListModel.value.productListData ?? []);
        productListFilteredList.value = productListData;
      } else {
        print('No data found');
      }
    } catch (e) {
      isProductIsLoading.value = false;
      isProductIsMoreLoading.value = false;
      print("This is an error: ${e.toString()}");
    } finally {
      isProductIsLoading.value = false;
      isProductIsMoreLoading.value = false;
    }
  }
  void productFilterSearch(String query) {
    if (query.isEmpty) {
      productListFilteredList.value = productListData;
    } else {
      productListFilteredList.value = productListData
          .where((item) =>
      item.name!.toLowerCase().contains(query.toLowerCase()) ||
          item.brandName!.contains(query.toLowerCase()) || item.categoryName!.contains(query.toLowerCase()))
          .toList();
    }
  }
}
