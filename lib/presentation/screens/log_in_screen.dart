import 'package:flutter/material.dart';
import 'package:kafiil_taskt/presentation/widgets/text_widget.dart';

import '../style/colors.dart';
import '../style/text_form_field_style.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_form_field_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
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
                margin: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 20, right: 20),
                width: 200,
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
                          //  const   SizedBox(
                          //       height: 20,
                          //     ),
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
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                                child: Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: mainColor,
                                  value: RememberMeCheck,
                                  onChanged: (value) {},
                                ),
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
