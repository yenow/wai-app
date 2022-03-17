import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/sign/sign_request_dto.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';
import 'package:wai/data/provider/who_am_i_api_provider.dart';

class WhoAmIRepository {
  final WhoAmIApiProvider whoAmIApiProvider;

  WhoAmIRepository({required this.whoAmIApiProvider});

  selectEnneagramType(EnneagramTestRequestDto enneagramTest) async {
    var result = await whoAmIApiProvider.selectEnneagramType(enneagramTest);
    return result;
  }
}