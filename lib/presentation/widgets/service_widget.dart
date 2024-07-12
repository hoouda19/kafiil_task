import 'package:flutter/material.dart';

import 'text_widget.dart';

class ServiceWidget extends StatelessWidget {
  final String image;
  final String title;
  const ServiceWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      // alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(image),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: mediaQuery.width / 3,
            child: TextWidget(
              textalign: TextAlign.left,
              text: title,
              size: 10,
              weight: FontWeight.bold,
              height: 1.7,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/icons/star.png'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: TextWidget(
                    textalign: TextAlign.start,
                    text: '(4.5)',
                    color: Colors.yellow,
                    size: 13,
                    weight: FontWeight.bold),
              ),
              const TextWidget(text: '|'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Image.asset('assets/icons/basket.png'),
              ),
              const TextWidget(text: '20')
            ],
          ),
        ],
      ),
    );
  }
}
