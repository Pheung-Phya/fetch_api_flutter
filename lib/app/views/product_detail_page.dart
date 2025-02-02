import 'package:api_flutter/app/controllers/product_controller.dart';
import 'package:api_flutter/app/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key});

  final product = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Image.network(product.selectedProduct.value!.image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.selectedProduct.value!.title,
                style: AppStyle.boldText(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    '${product.selectedProduct.value!.price} \$',
                    style: AppStyle.boldTextPrice(),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                      onPressed: () {},
                      child: Text(
                        'Add to Cart',
                        style: AppStyle.boldText(),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Reviews: ${product.selectedProduct.value!.rating.count}',
                    style: AppStyle.lightText(),
                  ),
                  const Spacer(),
                  Text(
                    '⭐${product.selectedProduct.value!.rating.rate}',
                    style: AppStyle.lightText(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.selectedProduct.value!.description,
                style: AppStyle.lightText(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
