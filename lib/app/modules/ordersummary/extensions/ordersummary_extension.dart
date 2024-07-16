

import 'dart:convert';

import 'package:coke_cupa/app/modules/orderSummary/model/orderSummary_model.dart';

import '../../../../api/api/api_controller.dart';
import '../../../../api/api/api_url.dart';


extension HomeExtension on ApiController{
  Future<OrderSummary> orderSummaryDataApi() async {
    try {
      // EasyLoading.show(status: "Loading...");
      final response = await httpClient.get(AppUrl.orderSummary);
      print("status code ${response}");

      if (response.statusCode == 200) {
        // EasyLoading.dismiss();

        return OrderSummary.fromJson(
            jsonDecode(response.bodyString ?? "{}"));
      } else {
        print('Request failed with status: ${response.statusCode}');
        // Handle error appropriately...
      }
    } catch (e) {
      print('Error during GET request: $e');
      // Handle error appropriately...
    }
    return OrderSummary();
  }



}