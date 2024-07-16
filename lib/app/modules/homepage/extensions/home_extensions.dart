import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../api/api/api_controller.dart';
import '../../../../api/api/api_url.dart';
import '../../product/model/addtocart_model.dart';
import '../model/banners.dart';
import '../model/getallproduct_model.dart';
extension HomeExtension on ApiController {
  Future<GetAllBanners>getAllBannersApi() async {
    try {
     // EasyLoading.show(status: "Loading...");
      final response = await httpClient.post(AppUrl.getBanners);
      print("status code ${response.body}");
      if (response.statusCode == 200) {
       // EasyLoading.dismiss();

        return GetAllBanners.fromJson(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}');
        // Handle error appropriately...
      }
    } catch (e) {
      print('Error during GET request: $e');
      // Handle error appropriately...
    }
    return GetAllBanners();
  }

  Future<GetAllProducts>getAllProductsApi() async {
    print("getAllProducts() call");
    try {
     // EasyLoading.show(status: "Loading...");
      final response = await httpClient.post(AppUrl.getAllProducts);
      print("status code of GetAllProducts----- ${response.statusCode}");
     // print("GetAllProducts ${response.body}");

      if (response.statusCode == 200) {
        print("GetAllProducts ${response.body}");
       // EasyLoading.dismiss();

        return GetAllProducts.fromJson(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle error appropriately...
      }
    } catch (e) {
      print('Error during GET request: $e');
      // Handle error appropriately...
    }
    return GetAllProducts();
  }

  Future<AddToCart>addToCart({required int productId,required int quantity,}) async {
    try {
    //  EasyLoading.show(status: "Loading...");
      final response = await httpClient.post(AppUrl.addToCart,body: {
        "product_id":productId,
        "quantity":quantity
      });
      print("status code ${response.body}");

      if (response.statusCode == 200) {
      //  EasyLoading.dismiss();

        return  AddToCart.fromJson(response.body
        );
      } else {
        print('Request failed with status: ${response.statusCode}');
        // Handle error appropriately...
      }
    } catch (e) {
      print('Error during GET request: $e');
      // Handle error appropriately...
    }
    return  AddToCart();
  }




}