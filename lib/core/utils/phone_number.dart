class PhoneNumber {
  PhoneNumber({
    this.countryName,
    this.countryCode,
    this.countryDigitMinLength,
    this.countryDigitMaxLength,
    this.countryDialCode,
    this.phoneNumber,
  });

  factory PhoneNumber.india() {
    return countriesPhoneNumberCodes
        .where((PhoneNumber element) => element.countryDialCode == '+91')
        .toList()
        .first;
  }

  String? countryName;
  String? countryCode;
  String? countryDialCode;
  int? countryDigitMinLength;
  int? countryDigitMaxLength;
  String? phoneNumber;

  static List<PhoneNumber> countriesPhoneNumberCodes = <PhoneNumber>[
    PhoneNumber(
      countryName: 'India',
      countryCode: 'IN',
      countryDigitMinLength: 10,
      countryDialCode: '+91',
    ),
    PhoneNumber(
      countryName: 'United States',
      countryCode: 'US',
      countryDigitMinLength: 8,
      countryDialCode: '+355',
    ),
    PhoneNumber(
      countryName: 'Japan',
      countryCode: 'JP',
      countryDigitMinLength: 7,
      countryDialCode: '+111',
    ),
    PhoneNumber(
      countryName: 'Sri landka',
      countryCode: 'SL',
      countryDigitMinLength: 12,
      countryDialCode: '+11',
    ),
  ];
}
