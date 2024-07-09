import 'package:flutter/material.dart';
import 'package:kafiil_taskt/presentation/widgets/text_widget.dart';

import '../style/text_form_field_style.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType inputType;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final bool obscureText;

  const TextFormFieldWidget(
      {super.key,
      required this.label,
      this.validator,
      this.onSaved,
      this.obscureText = false,
      required this.inputType,
      this.autocorrect = true,
      required this.textCapitalization});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 10),
          child: TextWidget(
            text: label,
          ),
        ),
        TextFormField(
          decoration: textFormFieldStyle,
          // const InputDecoration(labelText: 'Email Adress'),
          validator: validator,
          onSaved: onSaved,
          keyboardType: inputType,
          autocorrect: autocorrect,
          textCapitalization: TextCapitalization.none,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
