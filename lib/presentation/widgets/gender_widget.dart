import 'package:flutter/material.dart';
import 'text_widget.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int? _selectedGender;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 10),
          child: TextWidget(
            text: 'Gender',
          ),
        ),
        SizedBox(
          width: mediaQuery.width * 3 / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Radio<int>(
                      value: 1,
                      groupValue: _selectedGender,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const TextWidget(
                    text: 'Male',
                    weight: FontWeight.bold,
                  )
                ],
              ),
              Row(
                children: [
                  Radio<int>(
                    value: 2,
                    groupValue: _selectedGender,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                  const TextWidget(
                    text: 'Female',
                    weight: FontWeight.bold,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
