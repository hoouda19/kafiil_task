// import 'dart:convert';
// import 'package:flutter/services.dart';

// class Product {
//   final int id;
//   final String name;
//   final double price;
//   final String image;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//   });

//   Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
//     String jsonString = await rootBundle.loadString(filePath);
//     return jsonDecode(jsonString);
//   }

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       price: json['price'],
//       image: json['image'],
//     );
//   }
// }

// class ProductList {
//   final List<Product> bestSelling;
//   final List<Product> newArrival;
//   final List<Product> recommendedForYou;

//   ProductList(
//       {required this.bestSelling,
//       required this.newArrival,
//       required this.recommendedForYou});

//   factory ProductList.fromJson(Map<String, dynamic> json) {
//     return ProductList(
//       bestSelling: (json['bestSelling'] as List)
//           .map((i) => Product.fromJson(i))
//           .toList(),
//       newArrival:
//           (json['newArrival'] as List).map((i) => Product.fromJson(i)).toList(),
//       recommendedForYou: (json['recommendedForYou'] as List)
//           .map((i) => Product.fromJson(i))
//           .toList(),
//     );
//   }
// }
