import 'package:api_flutter/app/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_detail_page.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Products'),
      ),
      body: Obx(() {
        return ListView.builder(
            itemCount: productController.product.length,
            itemBuilder: (context, index) {
              var products = productController.product[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    productController.setSelectProduct(products);
                    Get.to(ProductDetailPage());
                  },
                  leading: SizedBox(
                    width: 30,
                    child: Image.network(products.image),
                  ),
                  title: Text(products.title),
                ),
              );
            });
      }),
    );
  }
}
