import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_taskt/presentation/style/colors.dart';

import 'text_widget.dart';

class ServiceWidget extends StatelessWidget {
  final String mainImage;
  final double price;
  final double? discount;
  final double priceAfterDiscount;
  final String title;
  final double averageRating;
  final int completedSalesCount;
  final bool recommended;
  const ServiceWidget(
      {super.key,
      required this.mainImage,
      required this.title,
      required this.price,
      this.discount,
      required this.priceAfterDiscount,
      required this.averageRating,
      required this.completedSalesCount,
      required this.recommended});

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        // alignment: Alignment.center,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image.network(
                    mainImage,
                    height: 100,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.sp),
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.sp, vertical: 8.sp),
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(27)),
                  child: TextWidget(
                    text: '$price',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (constraints.maxWidth > 600) ? 5.sp : 7.sp,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                width: 150.sp,
                child: TextWidget(
                  textalign: TextAlign.end,
                  text: title,
                  size: 10.sp,
                  weight: FontWeight.bold,
                  height: 1.7.sp,
                ),
              ),
            ),
            SizedBox(
              height: 7.sp,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/icons/star.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: TextWidget(
                      textalign: TextAlign.start,
                      text: '($averageRating)',
                      color: Colors.yellow,
                      size: 13.sp,
                      weight: FontWeight.bold),
                ),
                const TextWidget(text: '|'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.sp),
                  child: Image.asset('assets/icons/basket.png'),
                ),
                TextWidget(text: '$completedSalesCount')
              ],
            ),
            SizedBox(
              height: 7.sp,
            ),
          ],
        ),
      ),
    );
  }
}
