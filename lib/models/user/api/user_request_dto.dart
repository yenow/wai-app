class UserRequestDto {
  int? userId;
  String userKey;
  String? nickname;

  UserRequestDto({this.userId, required this.userKey, this.nickname});

  Map<String, dynamic> toJson() {
    return {
      "userId" : userId,
      "userKey" : userKey,
      "nickname" : nickname,
    };
  }

  @override
  String toString() {
    return 'UserRequestDto{userId: $userId, userKey: $userKey, nickname: $nickname}';
  }
}