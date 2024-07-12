import 'package:flutter/material.dart';
import 'package:kafiil_taskt/presentation/widgets/Container_widget.dart';
import 'package:kafiil_taskt/presentation/widgets/text_widget.dart';

import '../constants/strings.dart';
import '../widgets/circle_image_widget.dart';
import '../widgets/favourite_social_widget.dart';
import '../widgets/gender_widget.dart';
import '../widgets/multiline_text_field.dart';
import '../widgets/text_form_field_widget.dart';
import '../widgets/user_type_radio.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final TextEditingController aboutText = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: 'Who Am I',
            size: 20,
            weight: FontWeight.bold,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleImageWidget(image: 'assets/images/person.png'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextFormFieldWidget(
                  defaultValue: 'Mahmoud',
                  label: 'First Name',
                  inputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextFormFieldWidget(
                  defaultValue: 'Abdulmajeed',
                  label: 'Last Name',
                  inputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                ),
              ),
            ],
          ),
          TextFormFieldWidget(
            defaultValue: 'Hoouda19@gmail.com',
            label: 'Email Adress',
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !value.contains('@')) {
                return 'Enter a valid Email Adress';
              }
              return null;
            },
            autocorrect: false,
            inputType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
          ),
          TextFormFieldWidget(
            defaultValue: 'Mahmoud123456',
            visibilityIcon: true,
            label: 'Password',
            validator: (value) {
              if (value == null || value.trim().length < 6) {
                return 'Enter a valid Password';
              }
              return null;
            },
            autocorrect: false,
            inputType: TextInputType.visiblePassword,
            textCapitalization: TextCapitalization.none,
            obscureText: true,
          ),
          UserTypeRadio(),
          MultilineTextField(
            label: 'About',
            defaultValue: aboutTextString,
            controller: aboutText,
          ),
          ContainerWidget(
            label: 'Salary',
            child: TextWidget(
              text: 'SAR 4500',
              size: 17,
            ),
            height: mediaQuery.height / 12,
          ),
          ContainerWidget(
            label: 'Birth Date',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: '2000-12-07',
                  size: 17,
                ),
                const Icon(
                  Icons.date_range_outlined,
                  color: Colors.grey,
                )
              ],
            ),
            height: mediaQuery.height / 12,
          ),
          const GenderWidget(),
          const FavouriteSocialWidget(),
        ],
      ),
    );
  }
}
