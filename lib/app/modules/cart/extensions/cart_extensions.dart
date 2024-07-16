import 'dart:convert';

import 'package:coke_cupa/app/modules/product/extensions/product_extensions.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/connect.dart';

import '../../../../api/api/api_controller.dart';
import '../../../../api/api/api_url.dart';
import '../../product/model/remove.model.dart';
import '../models/getUserFromCart.dart';
import '../models/placeOrder.model.dart';

extension CartExtension on ApiController {
  Future<GetUserFromCart> getCartApi() async {
    try {
      // EasyLoading.show(status: "Loading...");
      final response = await httpClient.get(AppUrl.getUserCart);


      if (response.statusCode == 200) {
        print("home cart api");
        // EasyLoading.dismiss();
        print("status code of cart api ${response.body}");
        return GetUserFromCart.fromJson(response.body
            );
      } else {
        print('Request failed with status: ${response.statusCode}');
        // Handle error appropriately...
      }
    } catch (e) {
      print('Error during GET request: $e');
      // Handle error appropriately...
    }
    return GetUserFromCart();
  }

  Future<PlaceOrder> placeOrderApi(List<Map<String, dynamic>> products) async {
    try {
      final response = await httpClient.post(
        AppUrl.placeOrder,
        body: {
          "products": products,
        },
      );
      print("status code ${response.body}");

      if (response.statusCode == 200) {
        return PlaceOrder.fromJson(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during POST request: $e');
    }
    return PlaceOrder();
  }
}

extension ApiExtension on GetConnect{
  Future<Response> removeFromCartApi(Map<String, dynamic> body) async {
    const String url = AppUrl.removeCart; // Assuming AppUrl.updateCart is defined somewhere
    try {
      final removeFromCart  = (await put(url, body,)) ;
      return removeFromCart;
      // RemoveFromCart;
    } catch (e) {
      rethrow; // Propagate any exceptions
    }
  }

}