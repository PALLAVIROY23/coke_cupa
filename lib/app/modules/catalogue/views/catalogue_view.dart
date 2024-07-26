import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/widgets/color.extension.dart';
import '../../../../constants/widgets/mybutton.dart';
import '../../../routes/app_pages.dart';
import '../controllers/catalogue_controller.dart';

class CatalogueView extends GetView<CatalogueController> {
  const CatalogueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
        centerTitle: true,
      ),
      body: Obx(() {
        var catalogueProduct = controller.catalogueProduct.value;
        if (catalogueProduct.data == null || catalogueProduct.data!.rows == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                controller: controller.sc.value,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 260,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: catalogueProduct.data!.rows!.length,
                itemBuilder: (BuildContext ctx, index) {
                  var product = catalogueProduct.data!.rows![index];
                  var productId = product.id;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PRODUCT, arguments: product.toJson());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.0),
                              spreadRadius: 5,
                              blurStyle: BlurStyle.inner,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 110.h, // Set a fixed height for the image container
                              child: CachedNetworkImage(
                                imageUrl: product.mainImage ?? "assets/images/amazon.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              product.name ?? "",
                              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                              maxLines: 2,
                            ).paddingSymmetric(horizontal: 8.h),
                            SizedBox(height: 2.h),
                            Text(
                              product.shortDescription ?? "",
                              style: TextStyle(fontSize: 7.38.sp, fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                            ).paddingSymmetric(horizontal: 8.h),
                            SizedBox(height: 3.h),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: myButton(
                                text: "Add to cart",
                                textcolor: HexColor.fromHex("#FFFFFF"),
                                Color: HexColor.fromHex("#E31E24"),
                                onTap: () {
                                  controller.addToCart(product_id: productId ?? 0, quantity: 1);
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        );
      }),
    );
  }
}
