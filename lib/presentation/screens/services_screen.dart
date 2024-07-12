import 'package:flutter/material.dart';

import '../../data/model/best_sellings_model.dart';
import '../widgets/service_widget.dart';
import '../widgets/text_widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var servicesApi = Services(
        basketNumber: 20,
        id: DateTime.now().toString(),
        image: 'assets/images/Product_pic.png',
        title: 'Logo Design-Graphic Design Graphic Design');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: TextWidget(
            text: 'Services',
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: mediaQuery.height / 4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => ServiceWidget(
              image: servicesApi.image,
              title: servicesApi.title,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: TextWidget(
            text: 'Popular Services',
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: mediaQuery.height / 4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => const ServiceWidget(
              image: 'assets/images/Product_pic.png',
              title: 'Logo Design-Graphic Design Graphic Design',
            ),
          ),
        ),
      ],
    );
  }
}
