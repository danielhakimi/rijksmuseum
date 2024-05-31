import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'API_TOKEN')
  static const String apiToken = _Env.apiToken;
}
