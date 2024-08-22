class UserProfile {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? avatar;
  final int? gender;
  final String? birthDate;
  final String? about;
  final double? salary;
  final int? userType;
  final List<String>? favoriteSocialMedia;

  UserProfile({
    this.firstName,
    this.lastName,
    this.email,
    this.avatar,
    this.gender,
    this.birthDate,
    this.about,
    this.salary,
    this.userType,
    this.favoriteSocialMedia,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      avatar: json['avatar'],
      gender: json['gender'],
      birthDate: json['birth_date'],
      about: json['about'],
      salary: json['salary']?.toDouble(),
      userType: json['type']['code'],
      favoriteSocialMedia:
          List<String>.from(json['favorite_social_media'] ?? []),
    );
  }
}
