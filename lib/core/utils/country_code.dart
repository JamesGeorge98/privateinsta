class CountryCode {
  static List<CountryCodeModel> countryData = <CountryCodeModel>[
    CountryCodeModel(
      countryName: 'United States',
      countryCode: '+91',
      countryDigitLength: '10',
    ),
    CountryCodeModel(
      countryName: 'India',
      countryCode: '+91',
      countryDigitLength: '10',
    ),
    CountryCodeModel(
      countryName: 'Japna',
      countryCode: '+921',
      countryDigitLength: '10',
    ),
    CountryCodeModel(
      countryName: 'Sri landka',
      countryCode: '+911',
      countryDigitLength: '10',
    ),
  ];
}

class CountryCodeModel {
  CountryCodeModel({
    required this.countryName,
    required this.countryCode,
    required this.countryDigitLength,
  });

  final String countryName;
  final String countryCode;
  final String countryDigitLength;
}
