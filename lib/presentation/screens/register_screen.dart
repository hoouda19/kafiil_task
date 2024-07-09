import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_form_field_style.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/step_indicator_widget.dart';
import '../widgets/text_form_field_widget.dart';
import '../widgets/text_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var email = '';
  var password = '';
  var first_name = '';
  var last_name = '';
  var password_confirmation = '';
  // var currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    var mediaQuery = MediaQuery.of(context).size;

    void _submit() {
      Navigator.of(context).pushNamed('/registercompletedata');
      // setState(() {
      //   currentPage = 2;
      //   print(currentPage);
      // });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: SizedBox(
          height: mediaQuery.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppBarWidget(
                label: 'Register',
                onTap: () => Navigator.of(context).pop(),
              ),

              const StepIndicatorWidget(
                currentPage: 1,
              ),
              Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: TextFormFieldWidget(
                              label: 'First Name',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Enter a valid Email Adress';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                first_name = newValue!;
                              },
                              autocorrect: false,
                              inputType: TextInputType.emailAddress,
                              textCapitalization: TextCapitalization.none,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormFieldWidget(
                              label: 'Last Name',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Enter a valid Email Adress';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                last_name = newValue!;
                              },
                              autocorrect: false,
                              inputType: TextInputType.emailAddress,
                              textCapitalization: TextCapitalization.none,
                            ),
                          ),
                        ],
                      ),
                      TextFormFieldWidget(
                        label: 'Email Adress',
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains('@')) {
                            return 'Enter a valid Email Adress';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          email = newValue!;
                        },
                        autocorrect: false,
                        inputType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                      ),
                      TextFormFieldWidget(
                        label: 'Password',
                        validator: (value) {
                          if (value == null || value.trim().length < 6) {
                            return 'Enter a valid Password';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          password = newValue!;
                        },
                        autocorrect: false,
                        inputType: TextInputType.visiblePassword,
                        textCapitalization: TextCapitalization.none,
                        obscureText: true,
                      ),
                      TextFormFieldWidget(
                        label: 'Confirm Password',
                        validator: (value) {
                          if (value == null || value.trim().length < 6) {
                            return 'Enter a valid Password';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          password_confirmation = newValue!;
                        },
                        autocorrect: false,
                        inputType: TextInputType.visiblePassword,
                        textCapitalization: TextCapitalization.none,
                        obscureText: true,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15.0, bottom: 10),
                            child: TextWidget(
                              text: 'Gender',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: mediaQuery.height / 14,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [],
                          ),
                        ),
                      ),
                    ],
                  )),

              SizedBox(
                width: mediaQuery.width / 2,
                height: mediaQuery.width / 7,
                child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor:
                            const Color.fromARGB(255, 29, 191, 115)),
                    child: const TextWidget(
                      text: 'Next',
                      color: Colors.white,
                      size: 15,
                    )),
              ),

              // AnotherStepper(
              //   activeBarColor: mainColor,
              //   activeIndex: 2,
              //   // inActiveBarColor: mainColor,

              //   stepperList: stepperData,
              //   stepperDirection: Axis.horizontal,
              //   iconWidth:
              //       40, // Height that will be applied to all the stepper icons
              //   iconHeight:
              //       40, // Width that will be applied to all the stepper icons
              // ),
            ],
          ),
        )),
      ),
    );
  }
}
