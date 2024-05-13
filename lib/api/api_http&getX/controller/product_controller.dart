import 'package:flutter_starting_project/api/api_http&getX/service/http_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs; //here isLoading now in observable state
  var productList = [].obs;

  @override
  void onInit() {
    loadProduct(); //to fetch data from service class
    super.onInit();
  }

  void loadProduct() async {
    try {
      isLoading(true);
      var products = await HttpService.fetchProducts(); //doubt
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

/*
  void loadProduct() async {
  try {
    isLoading(true); // Assume there's a function called isLoading that takes a boolean parameter to manage loading state

    // Fetch products from an HTTP service (assume it's an asynchronous operation)
    var products = await HttpService.fetchProducts(); // This might be an asynchronous HTTP call

    // If products are successfully fetched, update the productList
    if (products != null) {
      productList.value = products; // Assume productList is a variable of type ValueNotifier or some reactive state management
    }

  } catch (e) {
    // Catch and print any errors that occur during the fetchProducts operation
    print(e);
  } finally {
    isLoading(false); // Set loading state to false regardless of success or failure
  }
}

   */
}
