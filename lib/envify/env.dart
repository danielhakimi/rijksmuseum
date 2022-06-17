import 'package:envify/envify.dart';

part 'env.g.dart';

@Envify()
abstract class Env {
  static const String apiToken = _Env.apiToken;
  static const String apiUrl = _Env.apiUrl;
}
