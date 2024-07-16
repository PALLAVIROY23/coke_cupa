


import 'package:coke_cupa/app/modules/cart/extensions/cart_extensions.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../api/api/api_controller.dart';
import '../../../../api/api/api_url.dart';
import '../model/addtocart_model.dart';
import '../model/remove.model.dart';
import '../model/updatecart.model.dart';

extension HomeExtension on ApiController  {
  Future<AddToCart>addToCart({required int productId,required int quantity} ) async {
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




  Future<UpdateCart>updateCartApi({required int productId, required int quantity, required String type}) async {
    try {
      // EasyLoading.show(status: "Loading...");
      final response = await httpClient.post(AppUrl.updateCart,body:
      {
        "product_id": productId,
        "quantity": quantity,
        "type": type,
      }
      );
      print("status code ${response.statusCode}");

      if (response.statusCode == 200) {
        // EasyLoading.dismiss();

        return UpdateCart.fromJson(response.body
        );

      } else {
        print('Request failed with status: ${response.statusCode}');
        // Handle error appropriately...
      }
    } catch (e) {
      print('Error during GET request: $e');
      // Handle error appropriately...
    }
    return UpdateCart();
  }


}





