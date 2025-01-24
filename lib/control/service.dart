import 'dart:convert';

import 'package:ecom/control/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  var products = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
     try {
      isLoading(true);
      var productData = await ApiService().fetchProducts();
     products.assignAll(productData);
     } catch (e) {
//       // Handle the error
       print("Error fetching products: $e");
    } finally {
     isLoading(false);
    }
  }

  

}
