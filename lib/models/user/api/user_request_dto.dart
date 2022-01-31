class UserRequestDto {
  int userId;
  String userKey;

  UserRequestDto({required this.userId, required this.userKey});

  Map<String, dynamic> toJson() {
    return {
    "userId" : userId,
    "userKey" : userKey
    };
  }
}