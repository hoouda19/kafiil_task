import 'package:flutter/material.dart';
import 'package:kafiil_taskt/presentation/widgets/text_widget.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType inputType;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final bool visibilityIcon;
  final String? defaultValue;
  final int maxLength;
  final TextEditingController? controller;

  const TextFormFieldWidget(
      {super.key,
      required this.label,
      this.validator,
      this.onSaved,
      this.maxLength = 50,
      this.obscureText = false,
      required this.inputType,
      this.autocorrect = false,
      required this.textCapitalization,
      this.visibilityIcon = false,
      this.defaultValue,
      this.controller});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 10),
          child: TextWidget(
            text: widget.label,
          ),
        ),
        TextFormField(
          initialValue: widget.defaultValue,
          maxLength: widget.maxLength,
          controller: widget.controller,
          decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            suffixIconColor: Colors.grey,
            suffixIcon: widget.visibilityIcon
                ? IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  )
                : null,
          ),

          // const InputDecoration(labelText: 'Email Adress'),
          validator: widget.validator,
          onSaved: widget.onSaved,
          keyboardType: widget.inputType,
          autocorrect: widget.autocorrect,
          textCapitalization: TextCapitalization.none,
          obscureText: !widget.visibilityIcon
              ? widget.obscureText
              : passwordVisible
                  ? false
                  : true,
        ),
      ],
    );
  }
}
