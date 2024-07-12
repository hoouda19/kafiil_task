import 'package:flutter/material.dart';

import '../style/colors.dart';
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
  final _form = GlobalKey<FormState>();
  var validationMessage = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    void _submit() {
      if (_form.currentState!.validate()) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Processing Data')),
        // );
        Navigator.of(context).pushNamed('/registercompletedata');
      } else {
        setState(() {
          validationMessage = true;
          print(validationMessage);
        });
      }
    }

    var listNumbers = ['Seller', 'Buyer', 'Both'];
    String workValue = 'Seller';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppBarWidget(
                label: 'Register',
                onTap: () => Navigator.of(context).pop(),
              ),
              validationMessage
                  ? Container(
                      color: const Color.fromRGBO(255, 240, 237, 1),
                      margin: const EdgeInsets.all(10),
                      child: const Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                          ),
                          TextWidget(
                            text: 'Fill the required fields',
                            color: Colors.red,
                          )
                        ],
                      ),
                    )
                  : Container(),
              Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const StepIndicatorWidget(
                        currentPage: 1,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: TextFormFieldWidget(
                              defaultValue: '',
                              label: 'First Name',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Enter a valid Name';
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
                              defaultValue: '',
                              label: 'Last Name',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Enter a valid Name';
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
                        defaultValue: '',
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
                        defaultValue: '',
                        visibilityIcon: true,
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
                        defaultValue: '',
                        visibilityIcon: true,
                        label: 'Confirm Password',
                        validator: (value) {
                          if (value == null ||
                              value.trim().length < 6 ||
                              password_confirmation != password) {
                            return 'The password not same';
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
                              text: 'User Type',
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
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: workValue,
                                items: listNumbers
                                    .map<DropdownMenuItem>(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: SizedBox(
                                            width: mediaQuery.width / 3,
                                            child: Text(e.toString())),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    workValue = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: mediaQuery.height / 14,
              ),
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
            ],
          )),
        ),
      ),
    );
  }
}
