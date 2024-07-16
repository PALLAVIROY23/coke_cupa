
import 'package:coke_cupa/app/modules/orderSummary/model/orderSummary_model.dart';
import 'package:coke_cupa/app/modules/product/extensions/product_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../homepage/model/add_to_cart_model.dart';
import '../../../../api/api/api_controller.dart';
import '../model/updatecart.model.dart';



class ProductController extends GetxController {
  ApiController apiController;

  ProductController({required this.apiController});
  //TODO: Implement ProductController
  // var productData = ProductDetails().obs;
  // var productDataList = ProductData(rows: [], count: 0, maxPoints: 0).obs;

  final count = 1.obs;
  var cartItems = [].obs;
  var cart = AddToCart().obs;
  var cartData = CartList().obs;
  var args= Get.arguments;
  RxInt dotPosition = 0.obs;
  var productId = 1.obs;
  var dotIndex = 0.obs;
  var arg = Get.arguments;
  var productDetails=Product.fromJson({}).obs;

  @override
  void onInit() {
    args=Get.arguments;
    print("args---$args");
    print("args---- ${args["main_image"]}");
if(args!=null){
  productDetails.value=Product.fromJson(args);
}
    // arg= Get.arguments;


    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  //Map<String, dynamic>args = {};


  void increment() => count.value++;
  void decrement() {
    if (count > 1) {
      count.value--;
    }
  }




  addToCart({required int product_id,required int quantity}) async {
    var cartItems = await apiController.addToCart(productId: product_id, quantity: quantity);
    print("add to cart api res--${cartItems.toJson()}");
    cart.value = AddToCart.fromJson(cartItems.toJson());
    if (cart.value.success ?? false) {
      EasyLoading.showSuccess(cart.value.message??"");
    }
  }





  // updateItemQuantity( int productId, int quantity, String type) async {
  //
  //   var res=await  apiController.updateCartApi(productId: productId, quantity: quantity, type: type );
  //
  //   if(res.success??false){
  //
  //       var index=args.indexWhere((element) => (element.productId??-1)==productId);
  //       if(index!=null&&index!=-1 ){
  //         args.quantity=quantity;
  //         args.refresh();
  //         update();
  //       }
  //
  //     }
  //
  // }
  // void removeItemFromCart(int productId, BuildContext context) {
  //   // Remove the item from the cart
  //   args.removeWhere((item) => item.productId == productId);
  //   // Update the cart count
  //   args.value.data?.count = args.length ?? 0;
  //   args.refresh();
  //
  //   // Show the popup message
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       Future.delayed(const Duration(seconds: 5), () {
  //         Navigator.of(context).pop(true);
  //       });
  //       return AlertDialog(
  //         title: Text('Your cart is successfully empty', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)),
  //       );
  //     },
  //   );
  // }



}
