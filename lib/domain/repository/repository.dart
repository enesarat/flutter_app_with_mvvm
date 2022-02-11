
import 'package:complete_flutter_app/data/network/failure.dart';
import 'package:complete_flutter_app/data/request/request.dart';
import 'package:complete_flutter_app/domain/model/model.dart';
import 'package:dartz/dartz.dart';

// DARTZ, EITHER CLASS : This class is very useful when we call a third-party API that we don't know very well in order to catch any unknown errors and return them in the function.

abstract class Repository{
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}