import 'package:api_flutter/app/models/products.dart';
import 'package:api_flutter/app/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var product = <Products>[].obs;
  ProductService service = ProductService();
  var selectedProduct = Rxn<Products>();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var productList = await service.fetchProducts();
    product.assignAll(productList);
  }

  void SetselectProduct(Products products) {
    selectedProduct.value = products;
  }
}
