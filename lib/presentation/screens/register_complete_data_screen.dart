import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_form_field_style.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/step_indicator_widget.dart';
import '../widgets/text_form_field_widget.dart';
import '../widgets/text_widget.dart';

class RegisterCompleteDataScreen extends StatefulWidget {
  const RegisterCompleteDataScreen({super.key});

  @override
  State<RegisterCompleteDataScreen> createState() =>
      _RegisterCompleteDataScreenState();
}

class _RegisterCompleteDataScreenState
    extends State<RegisterCompleteDataScreen> {
  @override
  Widget build(BuildContext context) {
    var about = '';
    var salary = '';
    var birthDate = DateTime.now();
    var gender = '';
    var skills = '';
    var cost = 1000;
    final _form = GlobalKey<FormState>();
    var mediaQuery = MediaQuery.of(context).size;
    int selectedOption = 1;

    void _submit() {}

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: mainColor,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Image.asset('assets/images/person_avatar.png')),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),

            const Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 10),
              child: TextWidget(
                text: 'About',
              ),
            ),
            SizedBox(
              height: mediaQuery.width / 3,
              child: TextField(
                maxLines: null,
                expands: true,
                // keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
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
                  const Card(
                      shape: CircleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Icon(
                          Icons.minimize_sharp,
                          color: Colors.green,
                        ),
                      )),
                  TextWidget(
                    text: 'SAR $cost',
                    weight: FontWeight.bold,
                  ),
                  const Card(
                      shape: CircleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                      )),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 10),
              child: TextWidget(
                text: 'Birth Date',
              ),
            ),
            Container(
              width: double.infinity,
              height: mediaQuery.height / 12,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 10),
              child: TextWidget(
                text: 'Gender',
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: const Text('Male'),
                  leading: Radio<int>(
                    value: 1,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Female'),
                  leading: Radio<int>(
                    value: 2,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 10),
              child: TextWidget(
                text: 'Skills',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 10),
              child: TextWidget(
                text: 'Favourite Social Media',
              ),
            ),

            SizedBox(
              height: mediaQuery.height / 30,
            ),
            SizedBox(
              width: double.infinity,
              height: mediaQuery.width / 7,
              child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: const Color.fromARGB(255, 29, 191, 115)),
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
        )),
      ),
    );
  }
}
