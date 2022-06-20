import 'package:dartz/dartz.dart';

import '../models/response_failure.dart';

extension TaskExtension<T> on Task<T> {
  Future<Either<ResponseFailure, T>> unwrapResponse() => attempt()
      .map((either) => either.leftMap((l) => l as ResponseFailure))
      .run();
}
