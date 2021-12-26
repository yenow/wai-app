class SimpleLoginInfo {
  String? nickname;
  String? birthDay;
  int year;
  int month;
  int day;
  Gender? gender;

  SimpleLoginInfo({
    this.nickname,
    this.birthDay,
    required this.year,
    required this.month,
    required this.day,
    this.gender
  });
}

enum Gender {
  male,
  female,
}
