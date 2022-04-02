import 'package:json_annotation/json_annotation.dart';

part 'ban_user_request.g.dart';

@JsonSerializable()
class BanUserRequest {
  int? userId;
  int? banUserId;

  BanUserRequest({
    this.userId,
    this.banUserId
  });

  factory BanUserRequest.fromJson(Map<String, dynamic> json) => _$BanUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BanUserRequestToJson(this);
}