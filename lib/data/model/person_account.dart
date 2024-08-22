import 'dart:io';

class PersonAccount {
  String firstName;
  String lastName;
  String about;
  List<int> tag;
  List<String> favoriteSocialMedia;
  int salary;
  String password;
  String email;
  String birthDate;
  bool gender;
  int type;
  String passwordConfirmation;
  File avatar;

  PersonAccount({
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tag,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.password,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.type,
    required this.passwordConfirmation,
    required this.avatar,
  });
}
      // 'avatar': await MultipartFile.fromFile(avatar.path, filename: 'avatar.jpg'),

