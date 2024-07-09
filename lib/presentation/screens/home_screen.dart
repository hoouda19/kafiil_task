// import 'package:flutter/material.dart';

// import 'package:slash_app/presentation/widgets/home_app_bar_widget.dart';
// import 'package:slash_app/presentation/widgets/home_banner_widget.dart';
// import 'package:slash_app/presentation/widgets/home_categories_list_widget.dart';
// import 'package:slash_app/presentation/widgets/home_search_widget.dart';
// import 'package:slash_app/presentation/widgets/nav_bar_widget.dart';
// import 'package:slash_app/presentation/widgets/product_widget.dart';
// import 'package:slash_app/presentation/widgets/title_row_widget.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.sizeOf(context);

//     return SafeArea(
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 15.0),
//             child: ListView(
//               shrinkWrap: true,
//               children: [
//                 const HomeAppBarWidget(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                         width: mediaQuery.width * 3 / 4,
//                         child: const HomeSearchWidget()),
//                     Card(
//                       shadowColor: Colors.white.withOpacity(0),
//                       color: const Color.fromARGB(130, 228, 228, 228)
//                           .withOpacity(0.5),
//                       child: SizedBox(
//                           width: 57,
//                           height: 57,
//                           child: Image.asset(
//                               'assets/icons/horizontal_slider.png')),
//                     )
//                   ],
//                 ),
//                 const HomeBannerWidget(),
//                 const Column(
//                   children: [
//                     TitleRowWidget(title: 'Categories'),
//                     HomeCategoriesListWidget(),
//                   ],
//                 ),
//                 const TitleRowWidget(title: 'Best Selling'),
//                 const ProductWidget(
//                   category: 'bestSelling',
//                 ),
//                 const TitleRowWidget(title: 'New Arrival'),
//                 const ProductWidget(
//                   category: 'newArrival',
//                 ),
//                 const TitleRowWidget(title: 'Recommended for you'),
//                 const ProductWidget(
//                   category: 'recommendedForYou',
//                 ),
//                 SizedBox(
//                   height: mediaQuery.height / 8,
//                 )
//               ],
//             ),
//           ),
//           const NavBarWidget(),
//         ],
//       ),
//     );
//   }
// }
