import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/model/person_account.dart';

class PersonAccountProvider extends ChangeNotifier {
  bool recorded = false;

  Future<void> postPersonAccount(PersonAccount account) async {
    final url = Uri.parse("https://test.kafiil.com/api/test/user/register");

    // Create the multipart request
    var request = http.MultipartRequest('POST', url)
      ..headers.addAll({
        "Accept": "application/json",
        "Accept-Language": "ar",
        "Content-Type": "multipart/form-data",
      })
      ..fields['first_name'] = account.firstName
      ..fields['last_name'] = account.lastName
      ..fields['about'] = account.about
      ..fields['tags[]'] = account.tag.join(',')
      ..fields['favorite_social_media[]'] =
          account.favoriteSocialMedia.join(',')
      ..fields['salary'] = account.salary.toString()
      ..fields['password'] = account.password
      ..fields['email'] = account.email
      ..fields['birth_date'] = account.birthDate
      ..fields['gender'] = account.gender ? '1' : '0'
      ..fields['type'] = account.type.toString()
      ..fields['password_confirmation'] = account.passwordConfirmation;

    // Attach the avatar file to the request
    if (account.avatar != null) {
      var stream = http.ByteStream(account.avatar.openRead());
      var length = await account.avatar.length();
      var multipartFile = http.MultipartFile(
        'avatar',
        stream,
        length,
        filename: account.avatar.path,
      );
      request.files.add(multipartFile);
    }

    // Send the request and handle the response
    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseData);
        recorded = jsonResponse['success'];

        print(jsonResponse);
      } else {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseData);
        print(jsonResponse);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  notifyListeners();
}





// class PersonAccountProvider extends ChangeNotifier {
//   bool recorded = false;

//   Future<void> postPersonAccount(PersonAccount personAccount) async {
//     final url = Uri.parse('https://test.kafiil.com/api/test/user/register');

//     try {
//       // Create a MultipartRequest
//       final request = http.MultipartRequest('POST', url);

//       // Add text fields
//       request.fields['first_name'] = personAccount.firstName;
//       request.fields['last_name'] = personAccount.lastName;
//       request.fields['about'] = personAccount.about;
//       request.fields['salary'] = personAccount.salary.toString();
//       request.fields['password'] = personAccount.password;
//       request.fields['email'] = personAccount.email;
//       request.fields['birth_date'] = personAccount.birthDate;
//       request.fields['gender'] = personAccount.gender ? 'true' : 'false';
//       request.fields['type'] = personAccount.type.toString();
//       request.fields['password_confirmation'] =
//           personAccount.passwordConfirmation;

//       // Add tags and favorite social media as JSON
//       request.fields['tags[]'] = jsonEncode(personAccount.tag);
//       request.fields['favorite_social_media[]'] =
//           jsonEncode(personAccount.favoriteSocialMedia);

//       // Add file
//       request.files.add(await http.MultipartFile.fromPath(
//           'avatar', personAccount.avatar.path));

//       // Send request
//       final response = await request.send();

//       // Handle response
//       final responseBody = await response.stream.bytesToString();
//       if (response.statusCode == 422) {
//         final jsonResponse = jsonDecode(responseBody);
//         recorded = false;

//         print(jsonResponse);
//       } else if (response.statusCode == 302) {
//         final jsonResponse = jsonDecode(responseBody);
//         print(jsonResponse.body);
//       } else if (response.statusCode == 200) {
//         print('Request successful');
//         recorded = true;
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         recorded = false;
//       }
//     } catch (e) {
//       print('Error occurred while sending request: $e');
//     }

//     notifyListeners();
//   }
// }
