import 'package:flutter/material.dart';
import 'package:kafiil_taskt/presentation/widgets/chip_widget.dart';
import 'package:kafiil_taskt/presentation/widgets/button_widget.dart';
import 'package:material_tag_editor/tag_editor.dart';

import '../widgets/Container_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/circle_image_widget.dart';
import '../widgets/favourite_social_widget.dart';
import '../widgets/gender_widget.dart';
import '../widgets/multiline_text_field.dart';
import '../widgets/step_indicator_widget.dart';
import '../widgets/text_widget.dart';

class RegisterCompleteDataScreen extends StatefulWidget {
  const RegisterCompleteDataScreen({super.key});

  @override
  State<RegisterCompleteDataScreen> createState() =>
      _RegisterCompleteDataScreenState();
}

class _RegisterCompleteDataScreenState
    extends State<RegisterCompleteDataScreen> {
  var salaryText = '';
  var birthDateText = DateTime.now();
  var genderText = '';
  var skillsText = '';
  var costText = 1000;
  int selectedOption = 1;
  List<String> values = [];
  final FocusNode focusNode = FocusNode();
  final TextEditingController aboutText = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    void _submit() {
      Navigator.of(context).pushNamed('/homescreen');
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
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
            const CircleImageWidget(image: 'assets/images/person.jpg'),
            MultilineTextField(
              label: 'About',
              defaultValue: '',
              controller: aboutText,
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
                        costText -= 500;
                      });
                    },
                    child: Card(
                        shape: const CircleBorder(),
                        child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Image.asset('assets/icons/union.png'))),
                  ),
                  TextWidget(
                    text: 'SAR $costText',
                    weight: FontWeight.bold,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        costText += 500;
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1980, 8),
                            lastDate: DateTime(2028));
                      },
                      icon: const Icon(
                        Icons.date_range_outlined,
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
            const GenderWidget(),
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
            ButtonWidget(text: 'Submit', onTap: _submit),
          ],
        )),
      ),
    );
  }
}
