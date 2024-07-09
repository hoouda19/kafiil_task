// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:slash_app/data/model/best_sellings_model.dart';

// part 'product_state.dart';

// class ProductCubit extends Cubit<ProductState> {
//   ProductCubit() : super(ProductInitial());

//   Future<ProductList> fetchProducts() async {
//     final String response =
//         await rootBundle.loadString('assets/json_file/dummyData.json');
//     final data = json.decode(response);
//     return ProductList.fromJson(data);
//   }

//   void getBestSellingProducts() async {
//     final List<Product> list = await fetchProducts().then(
//       (value) => value.bestSelling,
//     );
//     emit(BestSellingProductsLoadedState(list));
//   }

//   void getRecommendedForYouProducts() async {
//     final List<Product> list = await fetchProducts().then(
//       (value) => value.recommendedForYou,
//     );
//     emit(RecommendedForYouProductsLoadedState(list));
//   }

//   void getNewArrivalProducts() async {
//     final List<Product> list = await fetchProducts().then(
//       (value) => value.newArrival,
//     );
//     emit(NewArrivalProductsLoadedState(list));
//   }
// }
