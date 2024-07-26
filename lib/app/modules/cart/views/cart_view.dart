import 'package:coke_cupa/constants/widgets/cachImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/widgets/color.extension.dart';
import '../../../../constants/widgets/debouncer.dart';
import '../../../routes/app_pages.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final Debouncer debouncer = Debouncer(milliseconds: 500);

    controller.count.value;
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: controller.getUserCart.value.data?.count,);
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: const Image(
          image: AssetImage("assets/images/bottom navigation.png"),
          fit: BoxFit.fitWidth,
        ),
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: HexColor.fromHex("#E31E24"),
          leading: IconButton(
            onPressed: () {
              Get.back(result: controller.getUserCart.value.data?.count);
            },
            icon: Image.asset("assets/images/back arrow.png"),
          ),
          title: const Text('Cart', style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () => controller.getUserCart.value.data != null &&
                          controller.getUserCart.value.data!.rows != null &&
                          controller.getUserCart.value.data!.rows!.isNotEmpty
                      ? ListView.separated(
                          itemCount:
                              controller.getUserCart.value.data?.rows?.length ??
                                  0,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.toNamed(Routes.PRODUCT,
                                  arguments: controller.getUserCart.value.data!
                                      .rows?[index].product
                                      ?.toJson());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 110,
                                    width: 116,
                                    child: cacheImage(
                                        controller
                                                .getUserCart
                                                .value
                                                .data
                                                ?.rows?[index]
                                                .product
                                                ?.mainImage ??
                                            "",
                                        null,
                                        null,
                                        BoxFit.contain),
                                  ),
                                  SizedBox(width: 20.h),
                                  Flexible(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                                  .getUserCart
                                                  .value
                                                  .data
                                                  ?.rows?[index]
                                                  .product
                                                  ?.name ??
                                              " ",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          controller
                                                  .getUserCart
                                                  .value
                                                  .data
                                                  ?.rows?[index]
                                                  .product
                                                  ?.shortDescription ??
                                              " ",
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            Text(
                                              "Quantity",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(width: 10.h),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 7, right: 7),
                                                child: Container(
                                                  height: Get.height * 0.04,
                                                  width: Get.width * 0.31,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          int currentQuantity = (controller.getUserCart.value.data?.rows?[index].quantity ?? 0) - 1;

                                                          if (currentQuantity >= 1) {
                                                            controller.getUserCart.value.data?.rows?[index].quantity = currentQuantity;
                                                            controller.getUserCart.refresh();
                                                          } else {
                                                            // Remove the item if the quantity is less than 1
                                                            controller.removeItemCart(
                                                              controller.getUserCart.value.data?.rows?[index].productId ?? 0,
                                                              currentQuantity,
                                                              context,
                                                            );
                                                          }

                                                          debouncer(() {
                                                            if (currentQuantity >= 1) {
                                                              controller.updateItemQuantity(
                                                                controller.getUserCart.value.data?.rows?[index].productId ?? 0,
                                                                currentQuantity,
                                                                "remove",
                                                              );
                                                            } else {
                                                              controller.removeItemCart(
                                                                controller.getUserCart.value.data?.rows?[index].productId ?? 0,
                                                                currentQuantity,
                                                                context,
                                                              );
                                                            }
                                                          });
                                                        },
                                                        icon: const Icon(Icons.remove, color: Colors.red),
                                                      ),


                                                      Obx(
                                                        () => Text(
                                                          "${controller.getUserCart.value.data?.rows?[index].quantity ?? 0}",
                                                          style: TextStyle(
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#212121"),
                                                          ),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          controller.getUserCart.value.data?.rows?[index].quantity = (controller.getUserCart.value.data?.rows?[index].quantity ?? 0) + 1;
                                                          controller.getUserCart
                                                              .refresh();

                                                          debouncer(() {
                                                            int currentQuantity = (controller
                                                                        .getUserCart
                                                                        .value
                                                                        .data
                                                                        ?.rows?[
                                                                            index]
                                                                        .quantity ??
                                                                    0)
                                                                .toInt();
                                                            controller
                                                                .updateItemQuantity(
                                                              controller
                                                                      .getUserCart
                                                                      .value
                                                                      .data
                                                                      ?.rows?[
                                                                          index]
                                                                      .productId ??
                                                                  0,
                                                              currentQuantity,
                                                              "add",
                                                            );
                                                          });
                                                        },
                                                        icon: const Icon(
                                                            Icons.add,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20.h),
                        )
                      : const Center(child: Text("Cart is Empty")),
                ),
              ),
              SizedBox(height: 15.h),
              Obx(() => controller.getUserCart.value.data != null &&
                      controller.getUserCart.value.data!.rows != null &&
                      controller.getUserCart.value.data!.rows!.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        controller.placeOrder();
                      },
                      child: Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: HexColor.fromHex("#E31E24"),
                        ),
                        child: Center(
                          child: Text(
                            "Submit to Cupa",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: HexColor.fromHex("#FFFFFF"),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
