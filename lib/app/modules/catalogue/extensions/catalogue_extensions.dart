
import '../../../../api/api/api_controller.dart';
import '../../../../api/api/api_url.dart';
import '../model/catalogue_models.dart';

extension HomeExtension on ApiController{

  Future<ViewAllProducts> viewAllProductsApi({int page = 1, int pageSize = 10}) async {
    try {
      final response = await httpClient.post(
        "${AppUrl.getAllProducts}?page=1&size=10",
        body: {

        },
      );
      print("status code ${response.statusCode}");

      if (response.statusCode == 200) {
        return ViewAllProducts.fromJson(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}');
        // Handle error appropriately...
      }
    } catch (e) {
      print('Error during POST request: $e');
      // Handle error appropriately...
    }
    return ViewAllProducts(); // Return empty or default object on error
  }
}

