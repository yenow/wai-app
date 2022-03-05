import 'package:wai/data/provider/enneagram_api_provider.dart';


class EnneagramRepository {
  final EnneagramApiProvider enneagramApiProvider;

  EnneagramRepository({required this.enneagramApiProvider});

  getEnneagramInformation() {
    return enneagramApiProvider.getEnneagramInformation();
  }
}