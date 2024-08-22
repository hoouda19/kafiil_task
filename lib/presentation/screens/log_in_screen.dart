import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/login_provider.dart';
import '../../domain/token.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/check_box_widget.dart';
import '../widgets/text_form_field_widget.dart';
import '../widgets/text_widget.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    String email = '';
    String password = '';
    bool rememberMeCheck = true;
    var servicesList = Provider.of<Token>(context, listen: false);

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
                Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormFieldWidget(
                        defaultValue: '',
                        label: 'Email Address',
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains('@')) {
                            return 'Enter a valid Email Address';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          email = newValue!;
                        },
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
                        textCapitalization: TextCapitalization.none,
                        onSaved: (newValue) {
                          password = newValue!;
                        },
                        inputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CheckBoxWidget(
                                checkValue: rememberMeCheck,
                              ),
                              const SizedBox(width: 10),
                              const TextWidget(text: 'Remember me'),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const TextWidget(text: 'Forgot Password?'),
                          ),
                        ],
                      ),
                      SizedBox(height: mediaQuery.height / 30),
                      ButtonWidget(
                        text: 'Login',
                        onTap: () {
                          if (_form.currentState!.validate()) {
                            _form.currentState!.save();
                            context
                                .read<LoginProvider>()
                                .login(email, password, servicesList);
                            Navigator.of(context)
                                .pushReplacementNamed('/homescreen');
                          }
                        },
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
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
