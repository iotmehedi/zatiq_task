import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zatiq_task/core/core/extensions/extensions.dart';
import 'package:zatiq_task/features/product_list/data/model/product_list_model.dart';
import 'package:zatiq_task/features/product_list/presentation/controller/product_list_controller.dart';
import '../../../../core/network/configuration.dart';
import '../../../../core/utils/consts/app_colors.dart';
import '../../../../core/utils/consts/app_sizes.dart';
import '../../../../main.dart';
import '../../../widgets/cached_image_network/custom_cached_image_network.dart';
import '../../../widgets/circular_dot_animation/circular_dot_animation.dart';
import '../../../widgets/common_methods/common_methods.dart';
import '../../../widgets/custom_appbar/customAppBar_Widget.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custom_textfield/custom_textfield.dart';
import '../../../widgets/pagination_widget/pagination.dart';
import '../widget/common_card_widget.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarColor: AppColorsList.white,
        title: CustomSimpleText(
          text: "Referral Persons",
          fontWeight: FontWeight.bold,
          fontSize: AppSizes.size18,
          color: Colors.black,
        ),

      ),
      body: GetBuilder<ProductListController>(
        init: ProductListController(),
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  10.ph,
                  CustomTextfield(
                    controller: controller.productSearchController.value,
                    hintText: "Search",
                    lebelText: "🔎 Search",
                    textInputType: TextInputType.text,
                    onChanged: controller.productFilterSearch,
                  ),
                  10.ph,
                  Expanded(
                    child: Obx(
                      () =>
                          controller.isProductIsLoading.value == true
                              ? const Center(child: CircularDotsAnimation())
                              : controller.productListFilteredList.isEmpty
                              ? CommonMethods.notFoundArc()
                              : Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                child: RefreshIndicator(
                                  onRefresh:
                                      () =>
                                          controller.productListFunc(page: "1"),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return SizedBox(
                                        height: constraints.maxHeight,
                                        child: Obx(
                                          () => PaginationView<ProductListData>(
                                            isFromClosingTheLoop: true,
                                            items:
                                                controller
                                                    .productListFilteredList,
                                            itemPerPage: 20,
                                            itemBuilder: (_, item, index) {
                                              return CustomCard(item: item);
                                            },
                                            onNewLoad: (items, nextPage) {
                                              controller
                                                  .isProductIsMoreLoading
                                                  .value = true;
                                              print(
                                                "the page next $nextPage ${controller.productListModel.value.total}",
                                              );

                                              controller.productListFunc(
                                                page: nextPage.toString(),
                                              );
                                            },
                                            isLoading:
                                                controller
                                                    .isProductIsMoreLoading
                                                    .value,
                                            totalPage:
                                                controller
                                                    .productListModel
                                                    .value
                                                    .lastPage ??
                                                0,
                                            totalSize:
                                                controller
                                                    .productListModel
                                                    .value
                                                    .total ??
                                                0,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
