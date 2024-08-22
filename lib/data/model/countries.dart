class Countries {
  Countries(
      {required this.id,
      required this.countryCode,
      required this.name,
      required this.capital});
  final int id;
  final String countryCode;
  final String name;
  final String capital;

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      id: json['id'],
      countryCode: json['country_code'],
      name: json['name'],
      capital: json['capital'],
    );
  }
}
