import 'package:flutter/material.dart';
import 'package:kafiil_taskt/presentation/widgets/text_widget.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      // labelPadding: const EdgeInsets.only(left: 8.0),
      side: BorderSide.none,
      color: WidgetStateProperty.all(Colors.green[50]),
      label: TextWidget(
        text: label,
        color: Colors.green,
      ),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
