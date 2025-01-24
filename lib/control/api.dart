
import 'package:ecom/model/mode.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class ApiService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/comments";

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load products. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Error fetching products: $e");
    }
  }
}

