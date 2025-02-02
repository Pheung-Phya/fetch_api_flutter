import 'package:api_flutter/app/controllers/product_controller.dart';
import 'package:api_flutter/app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_detail_page.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productController = Get.find<ProductController>();
  final searchController = TextEditingController();
  final RxList<Products> filteredProducts = <Products>[].obs;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterProducts();
    });
  }

  void filterProducts() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredProducts.assignAll(productController.product);
    } else {
      filteredProducts.assignAll(productController.product
          .where((product) => product.category.contains(query))
          .toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Products'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Container(
              margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: 'Search products...',
                ),
              ),
            )),
      ),
      body: Obx(() {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemCount: filteredProducts.isEmpty
                ? productController.product.length
                : filteredProducts.length,
            itemBuilder: (context, index) {
              var products = filteredProducts.isEmpty
                  ? productController.product[index]
                  : filteredProducts[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    productController.setSelectProduct(products);
                    Get.to(ProductDetailPage());
                  },
                  title: SizedBox(
                    width: 30,
                    height: 200,
                    child: Image.network(
                      products.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  subtitle: Text(
                    products.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              );
            });
      }),
    );
  }
}
