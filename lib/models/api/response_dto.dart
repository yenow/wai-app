class ResponseDto {
  bool? isSuccess;
  String? errorMessage;
  DateTime? nowServerTime;

  ResponseDto({
    this.isSuccess, this.errorMessage, this.nowServerTime
  });

  factory ResponseDto.fromJson(Map<String, dynamic> json) {

    return ResponseDto(
      isSuccess: json['isSuccess'],
      errorMessage : json['errorMessage'],
      nowServerTime: json['nowServerTime'] != null ? DateTime.parse(json['nowServerTime']) : null,
    );
  }

  @override
  String toString() {
    return 'ResponseDto{isSuccess: $isSuccess, errorMessage: $errorMessage, nowServerTime: $nowServerTime}';
  }
}