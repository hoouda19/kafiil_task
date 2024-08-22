import 'package:flutter/foundation.dart';
import '../data/model/services_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicesViewModel extends ChangeNotifier {
  List<Service> _services = [];
  List<Service> _popularServices = [];
  bool isloading = true;

  List<Service> get services => _services;
  List<Service> get popularServices => _popularServices;

  ServicesViewModel() {
    _fetchServices();
    _fetchPopularServices();
  }

  Future<void> _fetchServices() async {
    final url = Uri.parse('https://test.kafiil.com/api/test/service');
    final headers = {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final List<dynamic> data = jsonResponse['data'];

        _services = data.map((item) => Service.fromJson(item)).toList();
        isloading = false;
        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching services: $e');
    }

    notifyListeners();
  }

  Future<void> _fetchPopularServices() async {
    final url = Uri.parse('https://test.kafiil.com/api/test/service/popular');
    final headers = {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final List<dynamic> data = jsonResponse['data'];

        _popularServices = data.map((item) => Service.fromJson(item)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching services: $e');
    }

    notifyListeners();
  }
}
