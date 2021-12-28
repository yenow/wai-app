class LoginResponseDto {

  bool isLoginSuccess;
  bool isErrorMessage;
  String? errorMessage;

  LoginResponseDto(
      {required this.isLoginSuccess, required this.isErrorMessage, this.errorMessage});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      isLoginSuccess: json['isLoginSuccess'],
      isErrorMessage: json['isErrorMessage'],
      errorMessage: json['errorMessage'],
    );
  }
}
