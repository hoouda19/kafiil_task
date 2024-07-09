import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../style/colors.dart';
import 'text_widget.dart';

class StepIndicatorWidget extends StatelessWidget {
  final int currentPage;
  const StepIndicatorWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);

    // Widget StepIndicatorContainer(String label) {
    //   return Stack(
    //     alignment: Alignment.centerRight,
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.only(bottom: mediaQuery.width / 7),
    //         child: TextWidget(
    //           text: label,
    //           color: mainColor,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 30,
    //         width: 30,
    //         child: Container(
    //           alignment: Alignment.center,
    //           // padding: const EdgeInsets.all(6),
    //           decoration: BoxDecoration(
    //               border: Border.all(color: mainColor, width: 2),
    //               color: Colors.grey[50],
    //               borderRadius: BorderRadius.all(Radius.circular(30))),
    //           child: TextWidget(
    //             text: pageNumber,
    //             weight: FontWeight.bold,
    //             size: 15,
    //             color: mainColor,
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // }

    return Stack(alignment: Alignment.center, children: [
      const Divider(
        thickness: 2,
      ),
      Padding(
        padding: EdgeInsets.only(
            right: currentPage == 1
                ? mediaQuery.width * 2 / 3
                : mediaQuery.width / 5),
        child: Divider(
          height: 20,
          thickness: 2,
          color: mainColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width / 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: mediaQuery.width / 7),
                  child: TextWidget(
                    text: 'Register',
                    color: mainColor,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: mainColor, width: 2),
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: TextWidget(
                      text: '1',
                      weight: FontWeight.bold,
                      size: 15,
                      color: mainColor,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: mediaQuery.width / 7),
                  child: TextWidget(
                    text: 'Complete Data',
                    color: mainColor,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Container(
                    alignment: Alignment.center,
                    // padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(color: mainColor, width: 2),
                        color: Colors.grey[50],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: TextWidget(
                      text: '2',
                      weight: FontWeight.bold,
                      size: 15,
                      color: mainColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
