
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../constants/widgets/Ratingbar.dart';
import '../../../../constants/widgets/color.extension.dart';
import '../../../routes/app_pages.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
   // print(controller.count.value);
    return Scaffold(
        bottomNavigationBar: const Image(image: AssetImage("assets/images/bottom navigation.png"),fit: BoxFit.fitWidth,),

        appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: HexColor.fromHex("#E31E24"),
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: Image.asset("assets/images/back arrow.png"),),
        title:  Text('Amazon Shopping Voucher',style: TextStyle(color:HexColor.fromHex("#FFFFFF"),fontSize: 20,fontWeight: FontWeight.w500)),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                child: Container(
                  height: Get.height*0.25,
                  width: Get.width*1,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: Get.height*0.70,
                    width: Get.width*0.9,
                    child: CarouselSlider.builder(
                      itemCount: 5,  // Adjust itemCount according to your data
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: controller.productDetails.value.mainImage ?? "",
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      options: carouselOptionsTopMobile(controllers: controller.dotIndex),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: Get.height*0.04,
                    width: Get.width*0.2,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1),
                      color: HexColor.fromHex("#EFEFEF")
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        StarRating(
                          starCount: 1,
                           rating: 1,
                          color: Colors.yellow[800]
                        ),
                         Text(controller.productDetails.value.rating.toString())

                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding:  const EdgeInsets.only(right: 135),
                child: Text(controller.productDetails.value.name??"",style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),)              ),
               SizedBox(height: 15.h,),
              Text(controller.productDetails.value.shortDescription??"",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),overflow: TextOverflow.clip,maxLines: 2,
              ) ,
               SizedBox(height: 10.h,),
              Text(controller.productDetails.value.longDescription?? "",style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,maxLines: 3,)      ,
              SizedBox(height: 10.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
               // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Quantity",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.33,
                    //margin: EdgeInsets.only(left: 0,),
                    //  padding: EdgeInsets.only(bottom: 3),

                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                      BorderRadius.circular(
                          8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: IconButton(
                            onPressed: () {
                             controller.decrement();
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Obx(
                          ()=> Text(
                            "${controller.count.value}",
                            style: TextStyle(
                              color: HexColor.fromHex("#212121"),
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            controller.increment();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                        ),

                      ],
                    ),

                  )
                ],
              ),
              SizedBox(height: 50.h,),
              InkWell(
                onTap:(){
                  controller.addToCart(product_id: controller.productDetails.value.id! , quantity:  controller.count.value);
                  print("addToCart-----${controller.addToCart(product_id: controller.productDetails.value.id!, quantity: controller.count.value)}");
                  Get.toNamed(
                    Routes.CART,
                  );
                } ,
                child: Container(
                    height: Get.height*0.06,
                    width: Get.width*0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: HexColor.fromHex("#E31E24")
                    ),
                    child: Center(child: Text("Add to cart",style: TextStyle(fontSize:14 ,fontWeight: FontWeight.w500,color: HexColor.fromHex("#FFFFFF")),))),
              )



            ],
          ),
        ),
      )
    );
  }
}
CarouselOptions carouselOptionsTopMobile({RxInt? controllers}) {
  return CarouselOptions(
    height: Get.height * 0.3,  // Adjust height as needed
    enlargeFactor: 0.1,
    viewportFraction: 0.99,  // Adjust viewport fraction to fit within the screen width
    enlargeCenterPage: true,
    scrollPhysics: AlwaysScrollableScrollPhysics(),
    initialPage: 0,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    onPageChanged: (index, reason) {
      controllers?.value = index;
    },
  );
}
