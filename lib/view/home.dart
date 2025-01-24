


import 'package:ecom/control/service.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController productController = Get.put(ProductController());
@override
  
  

  
  Widget build(BuildContext context) {
    return Scaffold(
        
      appBar: AppBar(
        centerTitle: true,
      
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),

      body: 
          Obx(() {
            if (productController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (productController.products.isEmpty) {
              return const Center(child: Text("No products available"));
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
               
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  final product = productController.products[index];
          
                  return GestureDetector(
                    onTap: () {
                      
                   
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: 65,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'PROFILE',
                                      style: TextStyle(color: Colors.black, fontSize: 10),
                                    ),
                                  ),
                                ),
                                // IconButton(onPressed: () {
                                  
                                // }, icon: Icon(Icons.favorite, color: Colors.grey, size: 22) )
                           
                              ],
                            ),
                          ),
                          // Product Image
                          Image.network(
                            product.images.isNotEmpty ? product.images[0] : '',
                            height: 120,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${product.name}",
                              style: const TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           
                            ],
                          ),
                         
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
        
      
    );
  }
}
