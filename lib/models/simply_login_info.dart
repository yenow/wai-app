import 'package:uuid/uuid.dart';

class SimpleLoginInfo {
  String? loginKey;
  String? nickname;
  String? birthDay;
  int year;
  int month;
  int day;
  String? gender;

  SimpleLoginInfo({
    this.loginKey,
    this.nickname,
    this.birthDay,
    required this.year,
    required this.month,
    required this.day,
    this.gender
  });

  Map<String, dynamic> toJson() => {
    'loginKey': const Uuid().v1(),
    'nickname': nickname,
    'birthDay': birthDay,
    'gender': gender,
  };
}


enum Gender {
  man,
  woman,
}
