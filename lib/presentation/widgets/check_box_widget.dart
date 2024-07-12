import 'package:flutter/material.dart';

import '../style/colors.dart';

class CheckBoxWidget extends StatefulWidget {
  bool checkValue = false;
  CheckBoxWidget({super.key, required this.checkValue});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        activeColor: mainColor,
        value: widget.checkValue,
        onChanged: (value) {
          setState(() {
            widget.checkValue = value!;
          });
        },
      ),
    );
  }
}
