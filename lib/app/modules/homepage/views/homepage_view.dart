import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constants/widgets/color.extension.dart';
import '../../../../constants/widgets/mybutton.dart';
import '../../../data/Contanst.dart';
import '../../../routes/app_pages.dart';
import '../controllers/homepage_controller.dart';
import 'package:badges/badges.dart' as badges;

class HomepageView extends GetView<HomepageController> {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Image(
        image: AssetImage("assets/images/bottom navigation.png"),
        fit: BoxFit.fitWidth,
      ),
      body: Obx(() {
        if (controller.products.value.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        print("controller.products.value.toJson()");
        print(controller.products.value.toJson());

        print(controller.count.value);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    height: Get.height * 0.4,
                    width: Get.width,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Ellipse 2.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 200),
                        child: Image.asset(
                          "assets/images/splash (2).png",
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    child: IconButton(
                      onPressed: () async {
                        GetStorage box = GetStorage();
                        await box.remove(Contanst.TOKEN);
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      icon: const Icon(Icons.logout),
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                        child: InkWell(
                          onTap: ()async {
                            var removeData= await Get.toNamed(Routes.CART);
                            if(removeData!=null){
                              controller.count.value=removeData;
                              controller.count.refresh();
                              controller.update();

                            }
                          },
                          child: Obx(() => badges.Badge(
                            badgeContent: Text(
                              "${controller.count.value}",
                              style: const TextStyle(color: Colors.white),
                            ),
                            child: const CircleAvatar(
                              child: ImageIcon(AssetImage("assets/images/ion_cart.png")),
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 180,
                      ),
                      (controller.banners.value.data?.rows?.isNotEmpty ?? false)
                          ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              controller.dotPosition.value = index;
                            },
                            height: 200.0,
                            autoPlay: true,
                            viewportFraction: 16 / 9,
                          ),
                          items: controller.banners.value.data?.rows?.map((i) {
                            String imageUrl = i.url ?? "";
                            if (imageUrl.isEmpty) {
                              imageUrl = "assets/images/amazon.png";
                            }
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20), // Change the radius as needed
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20), // Match the border radius here
                                child: Image(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.cover, // Adjust the image fit as needed
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                          : const Center(
                        child: CircularProgressIndicator(),
                      ),
                      const SizedBox(height: 20),
                      Obx(() => DotsIndicator(
                        dotsCount: controller.banners.value.data?.rows?.length ?? 1,
                        position: controller.dotPosition.value,
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Image.asset("assets/images/Frame 1.png"),
                    Positioned(
                      right: 55,
                      bottom: 20,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ORDERSUMMARY);
                        },
                        child: Text(
                          "Order Summary",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: HexColor.fromHex("#FFFFFF"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Catalogue",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.89,
                        color: HexColor.fromHex("#000000"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.CATALOGUE);
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.92,
                          color: HexColor.fromHex("#000000"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              remainBody()
            ],
          ),
        );
      }),
    );
  }

  Widget remainBody() {
    if (controller.products.value.data == null || controller.products.value.data!.rows == null || controller.products.value.data!.rows!.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 260,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: controller.products.value.data!.rows!.length,
      itemBuilder: (BuildContext ctx, index) {
        var productId = controller.products.value.data!.rows?[index].id;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.PRODUCT, arguments: controller.products.value.data?.rows?[index].toJson());
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
                  Expanded(
                    child: SizedBox(
                      height: 110.h,
                      child: CachedNetworkImage(
                        imageUrl: controller.products.value.data?.rows?[index].mainImage ?? "assets/images/amazon.png",
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    controller.products.value.data?.rows?[index].name.toString() ?? "",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ).paddingSymmetric(horizontal: 8.h),
                  SizedBox(height: 2.h),
                  Text(
                    controller.products.value.data?.rows?[index].shortDescription.toString() ?? "",
                    style: TextStyle(
                      fontSize: 7.38.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
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
    );
  }
}
