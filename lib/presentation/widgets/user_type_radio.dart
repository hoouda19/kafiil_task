import 'package:flutter/material.dart';
import 'text_widget.dart';

class UserTypeRadio extends StatefulWidget {
  int selectedRole = 0;
  UserTypeRadio({super.key, required this.selectedRole});

  @override
  State<UserTypeRadio> createState() => _UserTypeRadioState();
}

class _UserTypeRadioState extends State<UserTypeRadio> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 10),
          child: TextWidget(
            text: 'User Type',
          ),
        ),
        SizedBox(
          width: mediaQuery.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Radio<int>(
                      value: 2,
                      groupValue: widget.selectedRole,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedRole = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const TextWidget(
                    text: 'Seller',
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio<int>(
                    value: 1,
                    groupValue: widget.selectedRole,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedRole = value!;
                      });
                    },
                  ),
                  const TextWidget(
                    text: 'Buyer',
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio<int>(
                    value: 3,
                    groupValue: widget.selectedRole,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedRole = value!;
                      });
                    },
                  ),
                  const TextWidget(
                    text: 'Both',
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
