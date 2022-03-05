import 'package:wai/data/model/sign.dart';
import 'package:wai/data/model/sign_request_dto.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';


class SignUpRepository {
  final SignUpApiProvider signUpApiProvider;

  SignUpRepository({required this.signUpApiProvider});

  signUpAsNonMember(SignRequestDto signRequestDto) {
    return signUpApiProvider.signUpAsNonMember(signRequestDto);
  }
}