import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../style/colors.dart';

class CircleImageWidget extends StatefulWidget {
  CircleImageWidget({super.key, required this.imageFile});
  Widget imageFile;

  @override
  State<CircleImageWidget> createState() => _CircleImageWidgetState();
}

class _CircleImageWidgetState extends State<CircleImageWidget> {
  // Future<void> _pickImage() async {
  //   try {
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? image = await picker.pickImage(source: ImageSource.camera);
  //     setState(() {
  //       widget.imageFile = File(image!.path);
  //     });
  //   } catch (e) {
  //     print('Error picking image: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
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
              child: SizedBox(
                  height: 100,
                  width: 100,
                  // padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: widget.imageFile)),
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
    );
  }
}
