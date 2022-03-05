class WiseSayingRequestDto {
  int? lastId;


  WiseSayingRequestDto({
    this.lastId
  });

  Map<String, dynamic> toJson() {
    return {
      "lastId" : lastId
    };
  }
}