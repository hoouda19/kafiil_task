import 'package:flutter/foundation.dart';

class FavouriteSocialList extends ChangeNotifier {
  List<Map<String, dynamic>> favouriteSocialList = [
    {
      'checkValue': false,
      'icon': 'assets/icons/facebook.png',
      'text': 'Facebook'
    },
    {'checkValue': false, 'icon': 'assets/icons/twitter.png', 'text': 'x'},
    {
      'checkValue': false,
      'icon': 'assets/icons/linkedin.png',
      'text': 'Linkedin'
    },
  ];
  @override
  notifyListeners();
}
