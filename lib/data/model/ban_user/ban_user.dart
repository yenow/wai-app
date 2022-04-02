import 'package:json_annotation/json_annotation.dart';

part 'ban_user.g.dart';

@JsonSerializable()
class BanUser {
  int? userId;
  int? banUserId;
  String? banNickname;

  BanUser({
    this.userId, this.banUserId, this.banNickname
  });

  factory BanUser.fromJson(Map<String, dynamic> json) => _$BanUserFromJson(json);
  Map<String, dynamic> toJson() => _$BanUserToJson(this);
}