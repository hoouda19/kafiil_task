import 'package:flutter/material.dart';

import 'text_widget.dart';

class MultilineTextField extends StatelessWidget {
  final String label;
  final String defaultValue;
  final TextEditingController? controller;
  const MultilineTextField(
      {super.key,
      this.controller,
      required this.defaultValue,
      required this.label});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 10),
          child: TextWidget(
            text: label,
          ),
        ),
        SizedBox(
          height: mediaQuery.width / 3,
          child: TextField(
            controller: controller!..text = defaultValue,
            maxLines: null,
            expands: true,
            // keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
      ],
    );
  }
}
