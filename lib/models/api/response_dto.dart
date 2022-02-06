class ResponseDto {
  bool? isSuccess;
  int? errorCode;
  String? errorMessage;
  DateTime? nowServerTime;

  ResponseDto({
    this.isSuccess, this.errorCode, this.errorMessage, this.nowServerTime
  });

  void setDto(ResponseDto responseDto) {
    isSuccess = responseDto.isSuccess;
    errorCode = responseDto.errorCode;
    errorMessage =  responseDto.errorMessage;
  }

  factory ResponseDto.fromJson(Map<String, dynamic> json) {

    return ResponseDto(
      isSuccess: json['isSuccess'],
      errorCode: json['errorCode'],
      errorMessage : json['errorMessage'],
      nowServerTime :json['nowServerTime'] != null ? DateTime.parse(json['nowServerTime']) : null,
    );
  }

  @override
  String toString() {
    return 'ResponseDto{isSuccess: $isSuccess, errorCode: $errorCode, errorMessage: $errorMessage, nowServerTime: $nowServerTime}';
  }
}