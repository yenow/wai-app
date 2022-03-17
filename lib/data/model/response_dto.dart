class ResponseDto {
  DateTime? nowServerTime;

  ResponseDto({
    this.nowServerTime
  });


  factory ResponseDto.fromJson(Map<String, dynamic> json) {

    return ResponseDto(
      nowServerTime :json['nowServerTime'] != null ? DateTime.parse(json['nowServerTime']) : null,
    );
  }

}