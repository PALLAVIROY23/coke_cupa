import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

import '../../app/routes/app_pages.dart';


class ApiController extends GetConnect implements GetxService {
  GetStorage getStorage = GetStorage();

  @override
  void onInit() async {
    await getStorage.initStorage;
    super.onInit();

    httpClient.timeout = const Duration(seconds: 60);

    httpClient.addRequestModifier((Request request) async {


      request.headers['Authorization'] =
      'Bearer ${getStorage.read('token') ?? ""}';
      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      if (kDebugMode) {
        // log.info("-------------------------------------------------");
        // log.info(request.url);
        final List<int> bodyBytes = await request.bodyBytes.fold<List<int>>(
          <int>[],
              (List<int> previous, List<int> element) => previous..addAll(element),
        );

        // Convert List<int> to String
        final requestBody = utf8.decode(bodyBytes);

        // Print the request body payload
        // log.info("Request Body: $requestBody");
        // log.info(response.statusCode);
        // log.info(response.body);
        // log.info(getStorage.read('token') ?? "");
        // log.info("-------------------------------------------------");
      }
      if (response.statusCode == 401) {
        Get.offAllNamed(Routes.LOGIN);
      }
      return response;
    });
  }
}
