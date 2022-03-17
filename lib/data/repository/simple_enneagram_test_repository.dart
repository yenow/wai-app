import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/sign/sign_request_dto.dart';
import 'package:wai/data/provider/simple_enneagram_test_api_provider.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';
import 'package:wai/data/provider/simple_enneagram_test_api_provider.dart';

class SimpleEnneagramTestRepository {
  final SimpleEnneagramTestApiProvider simpleEnneagramTestApiProvider;

  SimpleEnneagramTestRepository({required this.simpleEnneagramTestApiProvider});

  saveSimpleEnneagramTest(EnneagramTestRequestDto enneagramTestRequestDto) async {
    return await simpleEnneagramTestApiProvider.saveSimpleEnneagramTest(enneagramTestRequestDto);
  }
}