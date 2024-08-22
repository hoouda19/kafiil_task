import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_taskt/data/model/person_account.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:provider/provider.dart';

import '../../domain/person_account_provider.dart';
import '../constants/favourite_social_list.dart';
import '../widgets/Container_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/chip_widget.dart';
import '../widgets/circle_image_widget.dart';
import '../widgets/favourite_social_widget.dart';
import '../widgets/gender_widget.dart';
import '../widgets/multiline_text_field.dart';
import '../widgets/step_indicator_widget.dart';
import '../widgets/text_form_field_widget.dart';
import '../widgets/text_widget.dart';
import '../widgets/user_type_radio.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordConfirmation = TextEditingController();
  final TextEditingController about = TextEditingController();
  int selectedType = 2;
  int salary = 1000;
  List<String> selectedFavouriteSocialList = [];
  List<int> tags = [];
  bool gender = false;
  File? avatar;
  bool correntAccount = false;

  final _form = GlobalKey<FormState>();
  bool validationMessage = false;
  int selectedOption = 1;
  bool firstPage = true;
  List<String> values = [];
  final FocusNode focusNode = FocusNode();
  DateTime? selectedDate;
  void _firstSubmit() {
    if (_form.currentState!.validate()) {
      setState(() {
        firstPage = false;
      });
    } else {
      setState(() {
        validationMessage = true;
        print(validationMessage);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    passwordConfirmation.dispose();
    about.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    void submit() {
      var servicesList =
          Provider.of<PersonAccountProvider>(context, listen: false);
      var favouriteSocialprovider =
          Provider.of<FavouriteSocialList>(context, listen: false);

      selectedFavouriteSocialList = favouriteSocialprovider.favouriteSocialList
          .where((item) => item['checkValue'] == true)
          .map((item) => item['text'] as String)
          .toList();

      tags = values.map(int.parse).toList();

      // print('firstName ${firstName.text}');
      // print('lastName ${lastName.text}');
      // print('about ${about.text}');
      // print('tags ${tags}');
      // print('selectedFavouriteSocialList ${selectedFavouriteSocialList}');
      // print('salary ${salary}');
      // print('password ${password.text}');
      // print('email ${email.text}');
      // print(
      //     'DateFormat ${DateFormat('d-MMM-yy').format(selectedDate!).toString()}');
      // print('gender ${gender}');
      // print('selectedType ${selectedType}');
      // print('passwordConfirmation ${passwordConfirmation.text}');
      // print('avatar ${avatar!}');
      // print();
      if (avatar != null) {
        servicesList.postPersonAccount(PersonAccount(
            firstName: firstName.text,
            lastName: lastName.text,
            about: about.text,
            tag: tags, //[2],
            favoriteSocialMedia: [
              'facebook',
            ],
            // selectedFavouriteSocialList,
            salary: salary,
            password: password.text,
            email: email.text,
            birthDate:
                DateFormat('yyyy-MM-dd').format(selectedDate!).toString(),
            gender: gender,
            type: selectedType,
            passwordConfirmation: passwordConfirmation.text,
            avatar: avatar!));
        Future.delayed(
          const Duration(
            seconds: 3,
          ),
          () => Navigator.of(context).pop(),
        );
        // if (servicesList.recorded) {
        //   setState(() {
        //     correntAccount = true;
        //   });
        // }
      } else {
        setState(() {
          validationMessage = true;
        });
      }
    }

    Future<void> _pickImage() async {
      try {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(source: ImageSource.camera);
        setState(() {
          avatar = File(image!.path);
        });
      } catch (e) {
        print('Error picking image: $e');
      }
    }

    // var listNumbers = ['Seller', 'Buyer', 'Both'];
    // String workValue = 'Seller';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: firstPage
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppBarWidget(
                            label: 'Register',
                            onTap: () => Navigator.of(context).pop()),
                        validationMessage
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color.fromRGBO(255, 240, 237, 1),
                                ),
                                margin: const EdgeInsets.all(10),
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 3),
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
                                        maxLength: 64,
                                        label: 'First Name',
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Enter a valid Name';
                                          }
                                          return null;
                                        },
                                        controller: firstName,
                                        // onSaved: (newValue) {
                                        //   first_name = newValue!;
                                        // },
                                        autocorrect: false,
                                        inputType: TextInputType.emailAddress,
                                        textCapitalization:
                                            TextCapitalization.none,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: TextFormFieldWidget(
                                        controller: lastName,
                                        label: 'Last Name',
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Enter a valid Name';
                                          }
                                          return null;
                                        },
                                        autocorrect: false,
                                        inputType: TextInputType.emailAddress,
                                        textCapitalization:
                                            TextCapitalization.none,
                                      ),
                                    ),
                                  ],
                                ),
                                TextFormFieldWidget(
                                  label: 'Email Adress',
                                  controller: email,
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
                                  visibilityIcon: true,
                                  label: 'Password',
                                  controller: password,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length < 6) {
                                      return 'Enter a valid Password';
                                    }
                                    return null;
                                  },
                                  autocorrect: false,
                                  inputType: TextInputType.visiblePassword,
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: true,
                                ),
                                TextFormFieldWidget(
                                  visibilityIcon: true,
                                  controller: passwordConfirmation,
                                  label: 'Confirm Password',
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length < 8) {
                                      return 'The password not same';
                                    }
                                    return null;
                                  },
                                  autocorrect: false,
                                  inputType: TextInputType.visiblePassword,
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: true,
                                ),
                                UserTypeRadio(
                                  selectedRole: selectedType,
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
                              onPressed: _firstSubmit,
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
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBarWidget(
                          label: 'Register',
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        const StepIndicatorWidget(
                          currentPage: 2,
                        ),
                        InkWell(
                          onTap: _pickImage,
                          child: CircleImageWidget(
                            //'assets/images/person.jpg'
                            imageFile: avatar == null
                                ? Image.asset('assets/images/person.jpg')
                                : Image(
                                    image: FileImage(avatar!),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        MultilineTextField(
                          label: 'About',
                          controller: about,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 10),
                          child: TextWidget(
                            text: 'Salary',
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: mediaQuery.height / 12,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (salary > 100) {
                                      salary -= 100;
                                    }
                                  });
                                },
                                child: Card(
                                    shape: const CircleBorder(),
                                    child: Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: Image.asset(
                                            'assets/icons/union.png'))),
                              ),
                              TextWidget(
                                text: 'SAR $salary',
                                weight: FontWeight.bold,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    salary += 100;
                                  });
                                },
                                child: const Card(
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Colors.green,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        ContainerWidget(
                          label: 'Birth Date',
                          height: mediaQuery.height / 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                        weight: FontWeight.bold,
                                        text: selectedDate != null
                                            ? DateFormat('yyyy-MM-dd')
                                                .format(selectedDate!)
                                                .toString()
                                            : ''),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () async {
                                      selectedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1980, 8),
                                          lastDate: DateTime(2028));
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.date_range_outlined,
                                      color: Colors.grey,
                                    )),
                              )
                            ],
                          ),
                        ),
                        GenderWidget(
                          genderbool: gender,
                        ),
                        ContainerWidget(
                          label: 'Skills',
                          height: mediaQuery.height / 7,
                          child: TagEditor(
                            length: values.length,
                            delimiters: [',', ' '],
                            hasAddButton: true,
                            inputDecoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your tags...',
                            ),
                            onTagChanged: (newValue) {
                              setState(() {
                                values.add(newValue);
                              });
                            },
                            tagBuilder: (context, index) => ChipWidget(
                              index: index,
                              label: values[index],
                              onDeleted: (value) {
                                setState(() {
                                  values.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ),
                        const FavouriteSocialWidget(),
                        SizedBox(
                          height: mediaQuery.height / 30,
                        ),
                        ButtonWidget(
                            text: correntAccount ? 'Log In' : 'Submit',
                            onTap: correntAccount
                                ? () {
                                    Navigator.of(context).pop();
                                  }
                                : submit),
                      ],
                    )),
        ),
      ),
    );
  }
}
