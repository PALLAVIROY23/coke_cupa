
import 'package:coke_cupa/app/modules/catalogue/extensions/catalogue_extensions.dart';
import 'package:coke_cupa/app/modules/homepage/extensions/home_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../api/api/api_controller.dart';
import '../../homepage/model/add_to_cart_model.dart';
import '../model/catalogue_models.dart';

class CatalogueController extends GetxController {

  //TODO: Implement CatalogueController
  ApiController apiController;

  CatalogueController({required this.apiController});

  var sc=ScrollController().obs;
  var catalogueProduct = ViewAllProducts().obs;
  var cart = AddToCart().obs;
  var isLoading = false.obs;
  var currentPage = 1.obs;



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    sc.value.addListener(_scrollListener);
    // viewAllProduct();
    loadProducts();



  }
  void _scrollListener() {
    if (sc.value.position.pixels >
        sc.value.position.maxScrollExtent - 150) {
        loadMoreProducts();

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

  void loadProducts({int page = 1}) async {
    if (isLoading.value) return;
    isLoading.value = true;

    var result = await viewAllProduct(page: page);
    if (result.success ?? false) {
      if (page == 1) {
        catalogueProduct.value = result;
      } else {
        catalogueProduct.value.data?.rows?.addAll(result.data?.rows ?? []);
      }
      currentPage.value = page;
    }

    isLoading.value = false;
  }

  void loadMoreProducts() {
    loadProducts(page: currentPage.value + 1);
  }

  Future<ViewAllProducts> viewAllProduct({int page = 1, int pageSize = 10}) async {
    return await apiController.viewAllProductsApi(page: page, pageSize: pageSize);
  }
}



// void loadProducts({int page = 1}) async {
  //   if (isLoading.value) return;
  //   isLoading.value = true;
  //
  //   await viewAllProduct(page: page);
  //   currentPage.value = page;
  //   isLoading.value = false;
  // }
  //
  // void loadMoreProducts() {
  //   loadProducts(page: currentPage.value + 1);
  // }




