


class Product {
  final int id;
  final List<String> images;
 
  final String name;
  

  Product({
    required this.id,
    required this.images,
  
      required this.name,

  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var imagesList = json['images'] != null
        ? List<String>.from(json['images'])
        : <String>[];

   

    return Product(
      id: json['id'],
      images: imagesList,

     name: json['name']?.toString() ?? '',
    );
  }
}

