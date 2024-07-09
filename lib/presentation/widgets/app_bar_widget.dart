import 'package:flutter/material.dart';

import 'text_widget.dart';

class AppBarWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const AppBarWidget({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: onTap,
        ),
        TextWidget(
          text: label,
          size: 20,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}
