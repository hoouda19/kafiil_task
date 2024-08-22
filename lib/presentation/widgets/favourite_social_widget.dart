import 'package:flutter/material.dart';
import 'package:kafiil_taskt/presentation/widgets/check_box_widget.dart';
import 'package:kafiil_taskt/presentation/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../constants/favourite_social_list.dart';

class FavouriteSocialWidget extends StatelessWidget {
  const FavouriteSocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var servicesList = Provider.of<FavouriteSocialList>(context, listen: false);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 10),
            child: TextWidget(
              text: 'Favourite Social Media',
            ),
          ),
          ...servicesList.favouriteSocialList.map(
            (e) => Row(
              children: [
                CheckBoxWidget(
                  checkValue: e['checkValue'],
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  e['icon'],
                  height: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                TextWidget(text: e['text'])
              ],
            ),
          )
        ]);
  }
}
