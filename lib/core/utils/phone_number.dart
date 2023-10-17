class PhoneNumber {
  PhoneNumber({
    this.countryName,
    this.countryCode,
    this.countryDigitLength,
    this.phoneNumber,
  });

  factory PhoneNumber.india() {
    return countriesPhoneNumberCodes
        .where((PhoneNumber element) => element.countryCode == '+91')
        .toList()
        .first;
  }

  final String? countryName;
  final String? countryCode;
  final String? countryDigitLength;
  final String? phoneNumber;

  static List<PhoneNumber> countriesPhoneNumberCodes = <PhoneNumber>[
    PhoneNumber(
      countryName: 'India',
      countryCode: '+91',
      countryDigitLength: '10',
    ),
    PhoneNumber(
      countryName: 'United States',
      countryCode: '+355',
      countryDigitLength: '8',
    ),
    PhoneNumber(
      countryName: 'Japan',
      countryCode: '+111',
      countryDigitLength: '7',
    ),
    PhoneNumber(
      countryName: 'Sri landka',
      countryCode: '+11',
      countryDigitLength: '12',
    ),
  ];
}
