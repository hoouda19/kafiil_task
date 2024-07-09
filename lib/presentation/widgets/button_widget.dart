import 'package:flutter/material.dart';

import 'text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: mediaQuery.width / 7,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: const Color.fromARGB(255, 29, 191, 115)),
          child: TextWidget(
            text: text,
            color: Colors.white,
            size: 15,
          )),
    );
  }
}
