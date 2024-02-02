import 'package:flutter/material.dart';
import 'package:flutter_starting_project/api/api_http&getx/controller/product_controller.dart';
import 'package:flutter_starting_project/api/api_http&getx/view/widget/product_tile.dart';
import 'package:get/get.dart';

// import 'package:sept_b2_flutter/api/api_http&getx/controller/product_controller.dart';
// import 'package:sept_b2_flutter/api/api_http&getx/view/home/widget/product_tile.dart';
void main() {
  runApp(GetMaterialApp(
    home: ApiHome(),
  ));
}

class ApiHome extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("api_http&getX"),
      ),
      body: SizedBox(
        child: Obx(() {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
                itemCount: productController.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                });
          }
        }),
      ),
    );
  }
}
