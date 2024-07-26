import 'package:cached_network_image/cached_network_image.dart';
import 'package:coke_cupa/constants/widgets/color.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/ordersummary_controller.dart';

class OrdersummaryView extends GetView<OrdersummaryController> {
  const OrdersummaryView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.count.value.toString();
    //print(controller.orderSummaryD.value);

    return Scaffold(
      bottomNavigationBar: const Image(
        image: AssetImage("assets/images/bottom navigation.png"),
        fit: BoxFit.fitWidth,
      ),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: HexColor.fromHex("#E31E24"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset("assets/images/back arrow.png"),
        ),
        title: const Text(
          'Order summary',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          controller.orderSummaryData.value.data?.rows != null;
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Recent Orders",
                  style: TextStyle(
                    fontSize: 13.76,
                    fontWeight: FontWeight.w600,
                    color: HexColor.fromHex("#212121"),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                      () {
                    if (controller.orderSummaryData.value.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final rows = controller.orderSummaryData.value.data?.rows;
                    if (rows == null || rows.isEmpty) {
                      return const Center(child: Text("No recent orders."));
                    }

                    return ListView.separated(
                      itemCount: rows.length,
                      itemBuilder: (context, index) {
                        final product = rows[index].product;
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 110,
                                  width: 116,
                                  child: CachedNetworkImage(
                                    imageUrl: product?.mainImage ??
                                        "assets/images/amazon.png",
                                  ),
                                ),
                                SizedBox(width: 20.h),
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product?.name ?? " ",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        product?.shortDescription ?? " ",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 10.h),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 20.h),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
