import 'package:flutter/foundation.dart';
import '../data/model/Countries.dart';
import '../data/model/services_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CountriesProvider extends ChangeNotifier {
  List<Countries> _country = [];
  Map _countrydetails = {};
  bool isloading = true;

  List<Countries> get country => _country;
  Map get countrydetails => _countrydetails;

  CountriesProvider() {
    _fetchCountry();
  }

  Future<void> _fetchCountry() async {
    final url = Uri.parse('https://test.kafiil.com/api/test/country');
    final headers = {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final List<dynamic> countrydata = jsonResponse['data'];
        _countrydetails = jsonResponse['pagination'];
        _country = countrydata.map((item) => Countries.fromJson(item)).toList();
        isloading = false;
        notifyListeners();

        // _countrydetails =
        //     countrydetailsdata.map((item) => Countries.fromJson(item)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching services: $e');
    }

    notifyListeners();
  }
}
