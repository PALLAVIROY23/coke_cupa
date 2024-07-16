
import 'package:coke_cupa/api/api/api_controller.dart';
import 'package:coke_cupa/app/modules/orderSummary/model/orderSummary_model.dart';
import 'package:coke_cupa/app/modules/ordersummary/extensions/ordersummary_extension.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class OrdersummaryController extends GetxController {
  ApiController apiController;

  OrdersummaryController({required this.apiController});


  final count = 0.obs;
  var orderSummaryData = OrderSummary().obs ;


  // var orderSummary = OrderData().obs;
  var token = "".obs;

  @override
  Future<void> onInit() async {
    orderSummaryDetails();
    super.onInit();
    token.value = await GetStorage().read("token");

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  orderSummaryDetails()async{
    orderSummaryData.value =await apiController.orderSummaryDataApi();
    print("get all product---${orderSummaryData.value.toJson()}");
    if(orderSummaryData.value.success ?? false){
      print("get products---${orderSummaryData.value}");
    }

  }



}

