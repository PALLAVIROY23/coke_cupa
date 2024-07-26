import 'package:coke_cupa/app/modules/cart/extensions/cart_extensions.dart';
import 'package:coke_cupa/app/modules/product/extensions/product_extensions.dart';
import 'package:coke_cupa/constants/widgets/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../api/api/api_controller.dart';
import '../../../../constants/widgets/color.extension.dart';
import '../../../routes/app_pages.dart';
import '../../homepage/model/add_to_cart_model.dart';
import '../models/getUserFromCart.dart';

class CartController extends GetxController {
  //TODO: Implement CartController
  ApiController apiController;

  CartController({required this.apiController});

  var count = 0.obs;
  var cartItems = [].obs;
  var cart = AddToCart().obs;
  var cartData = CartList().obs;
  var getUserCart = GetUserFromCart().obs;
  var productID = 1.obs;
  var cartCount = 0.obs;
  var quantity = 0.obs;
 Debouncer debouncer = Debouncer(milliseconds: 500);


  @override
  void onInit() {
    getCart();

    super.onInit();
  }





  void increment() => count.value++;

  // Decrement the count
  void decrement() {}

  getCart() async {

    try {
      getUserCart.value = await apiController.getCartApi();

      print("get Cart---${getUserCart.value.toJson()}");
      if (getUserCart.value.success ?? false) {
        getUserCart.value = getUserCart.value;
        getUserCart.refresh();
        update();
        print("cart-----${getUserCart.value.toJson()}");
      } else {
        EasyLoading.showError("No Data Found");
      }
    }catch(e){
      EasyLoading.showError("$e");

    }
  }

  updateItemQuantity(int id, int quantity, String type) async {
    var res = await apiController.updateCartApi(
        productId: id, quantity: quantity, type: type);

    if (res.success ?? false) {
      var index = getUserCart.value.data?.rows
          ?.indexWhere((element) => (element.productId ?? -1) == id);
      if (index != null && index != -1) {
        getUserCart.value.data?.rows?[index].quantity = quantity;
        getUserCart.refresh();
        EasyLoading.showInfo("Your Cart is Updated");
        update();
      }
    }
  }


  placeOrder() async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    // Prepare the order data
    var orderData = getUserCart.value.data?.rows?.map((item) {
      return {
        "product_id": item.productId,
        "quantity": item.quantity,
      };
    }).toList();

    if (orderData == null || orderData.isEmpty) {
      Get.back();
      EasyLoading.showInfo( "Your cart is empty. Add some items to place an order.",);

      return;
    }

    try {
      // Make the API call
      var response = await apiController.placeOrderApi(orderData);

      // Handle the response
      if (response.success ?? false) {
        // Successfully placed the order
        Get.back(); // Close the loading indicator
        getUserCart.value.data?.rows?.clear();
        getUserCart.value.data?.count = 0;
        getUserCart.refresh();

        // Show the order confirmation dialog
        Get.dialog(
          AlertDialog(
            title: Column(
              children: [
                const Image(
                  image: AssetImage("assets/images/order confiremd.png"),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Order Confirmed!",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: HexColor.fromHex("#0B0903")),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Your Order has been Placed Successfully",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: HexColor.fromHex("#2C2C2C")),
                ),
                SizedBox(
                  height: 35.h,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed(Routes.HOMEPAGE);
                  },
                  child: Container(
                      height: Get.height * 0.06,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: HexColor.fromHex("#E31E24")),
                      child: Center(
                          child: Text(
                        "Go to home page",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HexColor.fromHex("#FFFFFF")),
                      ))),
                ),
              ],
            ),
          ),
        );
      } else {
        Get.back();
      }
    } catch (e) {
      // Handle exception
      Get.back(); // Close the loading indicator

    }
  }

  removeItemCart(int productId,int quantity, BuildContext context) async {
    try {
      var body = {'product_id': productId,
        "quantity":quantity,
        "type":"remove"
      }; // Adjust this according to your API requirements
      var response = await apiController.removeFromCartApi(body);

      if (response.statusCode == 200) {
        // Assuming statusCode 200 indicates success, adjust as per your API
        // Update local cart data
        getUserCart.value.data?.rows?.removeWhere((item) => item.productId == productId);
        //cartCount.value--;
        print("remove from cart ----${getUserCart.value.toJson()}");
        getUserCart.value.data?.count = getUserCart.value.data?.rows?.length ?? 0;
        getUserCart.refresh();

        EasyLoading.showInfo("Your product has been removed from the cart");
      } else {
        EasyLoading.showError("Failed to remove product from cart");
      }
    } catch (e) {
      EasyLoading.showError("An error occurred while removing the product");
    }
  }

  addToCart({required int product_id,required int quantity}) async {
    var cartItems = await apiController.addToCart(productId: product_id, quantity: quantity);
    print("add to cart api res--${cartItems.toJson()}");
    cart.value = AddToCart.fromJson(cartItems.toJson());
    if (cart.value.success ?? false) {
      count.value++;

      EasyLoading.showSuccess(cart.value.message??"");

    }
  }


}
