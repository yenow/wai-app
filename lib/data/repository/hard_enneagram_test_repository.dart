import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/sign/sign_request_dto.dart';
import 'package:wai/data/provider/hard_enneagram_test_api_provider.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';

class HardEnneagramTestRepository {
  final HardEnneagramTestApiProvider hardEnneagramTestApiProvider;

  HardEnneagramTestRepository({required this.hardEnneagramTestApiProvider});

  saveHardEnneagramTest(EnneagramTestRequestDto enneagramTestRequestDto) async {
    return await hardEnneagramTestApiProvider.saveHardEnneagramTest(enneagramTestRequestDto);
  }
}