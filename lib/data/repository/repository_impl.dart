
import 'package:complete_flutter_app/data/data_source/remote_data_source.dart';
import 'package:complete_flutter_app/data/network/error_handler.dart';
import 'package:complete_flutter_app/data/network/failure.dart';
import 'package:complete_flutter_app/data/network/network_info.dart';
import 'package:complete_flutter_app/data/request/request.dart';
import 'package:complete_flutter_app/domain/model/model.dart';
import 'package:complete_flutter_app/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:complete_flutter_app/data/mapper/mapper.dart';

class RepositoryImpl extends Repository{
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource,this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      try{
        final response = await _remoteDataSource.login(loginRequest);

        if(response.status==ApiInternalStatus.SUCCESS){ //success
          return Right(response.toDomain());
        }
        else{ // business logic error
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,response.message ?? ResponseMessage.DEFAULT));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}