
import 'package:coke_cupa/app/modules/cart/extensions/cart_extensions.dart';
import 'package:coke_cupa/app/modules/homepage/extensions/home_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../../../../api/api/api_controller.dart';
import '../../cart/models/getUserFromCart.dart';
import '../model/add_to_cart_model.dart';
import '../model/banners.dart';
import '../model/getallproduct_model.dart';

class HomepageController extends GetxController {
  //TODO: Implement HomepageController
  ApiController apiController;

  HomepageController({required this.apiController});
  var cartCount = 0.obs;

  var banners = GetAllBanners().obs;

  var products = GetAllProducts().obs;
  var dotIndex = 0.obs;

  RxBool isLoading = false.obs;
  RxInt dotPosition = 0.obs;

  var getUserCart = GetUserFromCart().obs;
  var count=0.obs;

  var cartItems = [].obs;
  var cart = AddToCart().obs;
  var cartData = CartList().obs;

  //var productDataRow = DataRow().obs;


  var token = "".obs;

  @override
  void onInit() async {
   // token.value = await GetStorage().read("token");
    getCart();
    getAllBanner();
     getAllProduct();
    addCart( quantity: 1);


    super.onInit();
  }

  TextEditingValue sliderValue = const TextEditingValue();


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getAllBanner() async {
     banners.value = await apiController.getAllBannersApi();
    print("get banner res---${banners.value.toJson()}");
    // banners.value = GetAllBanners.fromJson(res.toJson());
    if (banners.value.success ?? false) {
      print(banners.value);
      // bannerData.value = banners.value.data!;
    }
  }

  getAllProduct() async {
     products.value = await apiController.getAllProductsApi();

print("products.value response---${products.value.toJson()}");
    if (products.value.success ?? false) {
      // products.value = ;
     print("main image------${products.value}");
    }
    if(products.value == 10){

    }
    else{
    //  print("itemCount: ${products.value.data?? 0}");
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

   addCart({  required int quantity}) {
    cartCount.value++;

  }

   removeFromCart({required int product_id}) {
    if (cartCount.value > 0) {
      cartCount.value--;
    }
  }

  getCart() async {
     getUserCart.value = await apiController.getCartApi();

    print("home updated Cart---${getUserCart.value.toJson()}");
    print("home updated Cart---${getUserCart.value.message}");
    if (getUserCart.value.success ?? false) {
      // products.value = ;
      count.value=getUserCart.value.data!.count??0;

      print("homecart-----${getUserCart.value.toJson()}");
    } else {
      EasyLoading.showError("No Data Found");
    }
  }



}






