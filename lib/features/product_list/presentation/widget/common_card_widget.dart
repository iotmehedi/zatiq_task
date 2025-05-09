import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zatiq_task/core/core/extensions/extensions.dart';
import '../../../../core/network/configuration.dart';
import '../../../../core/utils/consts/app_colors.dart';
import '../../../../core/utils/consts/app_sizes.dart';
import '../../../widgets/cached_image_network/custom_cached_image_network.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custom_textfield/custom_textfield.dart';
import '../../data/model/product_list_model.dart';

Widget CustomCard({required ProductListData item}) {
  return Card(
    elevation: 3,
    color: AppColorsList.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomCachedImageNetwork(
              imageUrl: "${NetworkConfiguration.imageUrl}${item.img}",
              height: AppSizes.newSize(6),
              weight: AppSizes.newSize(8),
            ),
          ),
          10.pw,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSimpleText(text: item?.name ?? '', fontSize: AppSizes.size14),
                4.ph,
                CustomRichText(title: "${item.brandName}", heading: "Brand: ",
                headingFontSize: AppSizes.size12,
                  headingFontWeight: FontWeight.normal,
                  headingTextColor: Colors.black,
                  titleFontSIze: AppSizes.size12,
                  titleFontWeight: FontWeight.w500,
                  titleTextColor:  AppColorsList.green,
                ),
                4.ph,
                CustomRichText(title: "${item.sellingPrice}", heading: "Price: ",
                headingFontSize: AppSizes.size12,
                  headingFontWeight: FontWeight.normal,
                  headingTextColor: Colors.black,
                  titleFontSIze: AppSizes.size12,
                  titleFontWeight: FontWeight.w500,
                  titleTextColor:  AppColorsList.green,
                ),

              ],
            ),
          )
        ],
      ),
    ),
  );
}
