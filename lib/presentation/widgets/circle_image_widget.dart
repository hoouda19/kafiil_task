import 'package:flutter/material.dart';

import '../style/colors.dart';

class CircleImageWidget extends StatelessWidget {
  final String image;
  const CircleImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: mainColor,
                  ),
                  borderRadius: BorderRadius.circular(100)),
              child: SizedBox(
                  height: 100,
                  width: 100,
                  // padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.green,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }
}
