import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/model/userprofile.dart';

class UserProfileProvider with ChangeNotifier {
  UserProfile? _userProfile;
  bool _isLoading = false;

  UserProfile? get userProfile => _userProfile;
  bool get isLoading => _isLoading;

  Future<void> fetchUserProfile(String token) async {
    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse('https://test.kafiil.com/api/test/user/who-am-i');
      final headers = {
        'Authorization': token,
        'Accept': 'application/json',
        'Accept-Language': 'ar',
      };

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _userProfile = UserProfile.fromJson(data['data']);
      } else {
        print('Failed to load profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
