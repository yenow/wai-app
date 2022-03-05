
import 'package:uuid/uuid.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/sign_up_controller.dart';
import 'package:wai/data/model/sign_request_dto.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';
import 'package:wai/data/repository/sign_up_repository.dart';
import 'package:wai/main.dart';

main() async {
  initController();

  String createdUserKey = const Uuid().v4();
  String createdPassword = const Uuid().v4();
  String createdNickname = const Uuid().v4();

  SignRequestDto signRequestDto = SignRequestDto(
      userKey: createdUserKey,
      password: createdPassword,
      nickname: createdNickname
  );

  SignUpRepository signUpRepository = SignUpRepository(
      signUpApiProvider: SignUpApiProvider()
  );
  var response = await signUpRepository.signUpAsNonMember(signRequestDto);/*.then((data) {
    logger.d(data);
  });*/

  logger.d(response);

  SignRequestDto signRequestDto2 = SignRequestDto(
      userKey: createdUserKey,
      password: createdPassword,
      nickname: const Uuid().v4()
  );
  await signUpRepository.signUpAsNonMember(signRequestDto2).then((data) {
    logger.d(data);
  });

  SignRequestDto signRequestDto3 = SignRequestDto(
      userKey: const Uuid().v4(),
      password: createdPassword,
      nickname: createdNickname
  );
  await signUpRepository.signUpAsNonMember(signRequestDto3).then((data) {
    logger.d(data);
  });
}