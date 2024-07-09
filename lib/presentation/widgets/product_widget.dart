// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:slash_app/domain/cubit/product_cubit.dart';
// import 'package:slash_app/presentation/widgets/text_widget.dart';

// class ProductWidget extends StatelessWidget {
//   final String category;
//   const ProductWidget({super.key, required this.category});

//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.sizeOf(context);

//     return BlocProvider(
//       create: (context) => ProductCubit(),
//       child: BlocBuilder<ProductCubit, ProductState>(
//         builder: (context, state) {
//           List product = [];
//           if (state is ProductInitial) {
//             if (category == 'bestSelling') {
//               context.read<ProductCubit>().getBestSellingProducts();
//             } else if (category == 'newArrival') {
//               context.read<ProductCubit>().getNewArrivalProducts();
//             } else if (category == 'recommendedForYou') {
//               context.read<ProductCubit>().getRecommendedForYouProducts();
//             }
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is BestSellingProductsLoadedState &&
//               category == 'bestSelling') {
//             product = state.productList;
//           } else if (state is NewArrivalProductsLoadedState &&
//               category == 'newArrival') {
//             product = state.productList;
//           } else if (state is RecommendedForYouProductsLoadedState &&
//               category == 'recommendedForYou') {
//             product = state.productList;
//           } else {
//             return Container();
//           }

//           return LayoutBuilder(
//             builder: (context, constraints) => SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: SizedBox(
//                 width: !(constraints.maxWidth > 600) ? null : mediaQuery.width,
//                 child: Row(
//                   mainAxisAlignment: !(constraints.maxWidth > 600)
//                       ? MainAxisAlignment.start
//                       : MainAxisAlignment.center,
//                   children: [
//                     ...product.map(
//                       (e) => Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: LayoutBuilder(
//                           builder: (context, constraints) => Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Stack(
//                                 alignment: Alignment.topRight,
//                                 children: [
//                                   ClipRRect(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                       child: Image.asset(
//                                         e.image,
//                                         fit: BoxFit.cover,
//                                         height: constraints.maxWidth > 600
//                                             ? 120
//                                             : 250,
//                                         width: constraints.maxWidth > 600
//                                             ? 130
//                                             : 270,
//                                       )),
//                                   InkWell(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Image.asset(
//                                           'assets/icons/heart_icon.png'),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               TextWidget(
//                                 text: e.name,
//                                 size: 16,
//                                 textalign: TextAlign.start,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   TextWidget(
//                                     text: e.price.toString(),
//                                     size: 16,
//                                     weight: FontWeight.bold,
//                                   ),
//                                   const SizedBox(
//                                     width: 45,
//                                   ),
//                                   Image.asset('assets/icons/brand.png'),
//                                   Image.asset('assets/icons/add.png'),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
