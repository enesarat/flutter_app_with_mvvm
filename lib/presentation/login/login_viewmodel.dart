

import 'dart:async';

import 'package:complete_flutter_app/domain/usecase/login_usecase.dart';
import 'package:complete_flutter_app/presentation/base/baseviewmodel.dart';
import 'package:complete_flutter_app/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs, LoginViewModelOutputs{
  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();

  StreamController _isAllInputsValidStreamController = StreamController<void>.broadcast();

  var loginObject = LoginObject("","");

  LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _isAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  // INPUTS
  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  // TODO: implement inputIsAllInput
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  login() async {
    (await _loginUseCase.execute(LoginUseCaseInput(loginObject.userName,loginObject.password))).fold(
    (failure) =>
        { // left -> failure
          print(failure.message)
        },
    (data) =>
        { // right -> success (data)
          print(data.user?.name)
        }
      );
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
      password: password
    );
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(
        userName: userName
    );
    _validate();
  }

  // OUTPUTS
  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  @override
  // TODO: implement outputIsAllInputsValid
  Stream<bool> get outputIsAllInputsValid => _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  // Private functions
  _validate(){
    inputIsAllInputValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }
  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }
  bool _isAllInputsValid(){
    return _isUserNameValid(loginObject.userName) && _isPasswordValid(loginObject.password);
  }

}

abstract class LoginViewModelInputs{
  // three functions for actions
  setUserName(String userName);
  setPassword(String password);
  login();

  // two sinks for streams
  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutputs{
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}