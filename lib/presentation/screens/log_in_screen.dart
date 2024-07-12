import 'package:flutter/material.dart';
import 'package:kafiil_taskt/presentation/widgets/text_widget.dart';

import '../style/colors.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/check_box_widget.dart';
import '../widgets/text_form_field_widget.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var email = '';
    var password = '';
    var RememberMeCheck = true;
    void _submit() {
      Navigator.of(context).pushNamed('/homescreen');
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              AppBarWidget(
                label: 'Account Login',
                onTap: () {},
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                width: mediaQuery.width / 2,
                child: Image.asset('assets/images/login_cuate.png'),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                            inputType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.none,
                          ),
                          //  const   SizedBox(
                          //       height: 20,
                          //     ),
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
                            inputType: TextInputType.visiblePassword,
                            textCapitalization: TextCapitalization.none,
                            obscureText: true,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CheckBoxWidget(
                                checkValue: RememberMeCheck,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const TextWidget(
                                text: 'Remember me',
                              ),
                            ],
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: const TextWidget(text: 'Forgot Password?'))
                        ],
                      ),
                      SizedBox(
                        height: mediaQuery.height / 30,
                      ),
                      ButtonWidget(
                        text: 'Login',
                        onTap: _submit,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: 'Don’t have an account ?',
                            size: 16,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                              child: const TextWidget(
                                text: 'Register',
                                size: 15,
                                color: Colors.green,
                                weight: FontWeight.bold,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
