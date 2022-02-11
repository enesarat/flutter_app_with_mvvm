

import 'package:complete_flutter_app/data/network/failure.dart';
import 'package:complete_flutter_app/domain/usecase/login_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In,Out>{
  Future<Either<Failure,Out>> execute(LoginUseCaseInput input);
}
