import 'package:mobx/mobx.dart';

part 'sign_in_store.g.dart';
class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store{

  @observable
  String email = '';
  @observable 
  String password = '';
  @observable
  bool passwordVisible = false;
   @observable
   bool isLoading = false;

  @action
  void setEmail(String value)=> email=value;

  @action 
  void setPassword(String value)=>password=value;

  @action
  void togglePassword()=> passwordVisible = !passwordVisible;

    @action
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor informe um e-mail';
    }
    else if(!isEmailValid){
      return'Por favor informe um e-mail correcto';
    }
    return null;
  }
  @action
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor informe uma senha';
    }
    else if(value.length<=3){
      return'A sua senha deve conter no mínimo 4 caracteres';
    }
    return null;
  }

  @computed
  bool get isEmailValid => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  @computed 
  bool get isPasswordValid => password.length>=4;
 @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
    @computed 
  bool get loading =>!isLoading;
 


}
