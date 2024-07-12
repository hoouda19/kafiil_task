import 'package:flutter/material.dart';

import 'text_widget.dart';

class ContainerWidget extends StatelessWidget {
  final Widget child;
  final String label;
  final double height;
  const ContainerWidget(
      {super.key,
      required this.child,
      required this.height,
      required this.label});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 10),
          child: TextWidget(
            text: label,
          ),
        ),
        Container(
          width: double.infinity,
          height: height,
          alignment: Alignment.centerLeft, //here
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: Padding(padding: const EdgeInsets.all(8.0), child: child),
        ),
      ],
    );
  }
}
