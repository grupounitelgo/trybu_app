import 'package:mobx/mobx.dart';
part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {

  //observables 

  @observable
  String name = '';
  @observable
  String email = '';
  @observable
  String phoneNumber = '';
  @observable
  String password = '';
  @observable
  String confirmPassword = '';
  @observable
  bool passWordVisible = false;
   @observable
  bool confirmPasswordVisible = false;
   @observable
   bool isLoading = false;


  @action
  void togglePasswordVisible()=> passWordVisible = !passWordVisible;
  @action
  void toggleConfirmPassword()=> passWordVisible =  !passWordVisible;
//onchangeds
  @action
  void setName(value) => name = value;
  @action
  void setEmail(value) => email = value;
  @action
  void setPhoneNumber(value) => phoneNumber = value;
  @action
  void setPassword(value) => password = value;
  @action
  void setConfirmPassword(value) => confirmPassword = value;

  //validators
  @action
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor informe um nome';
    }
    
    return null;
  }
  @action
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor informe o número de telefone';
    }
    return null;
  }
  @action
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor informe um e-mail';
    }
    return null;
  }
  @action
   String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor informe uma senha de 6 dígitos';
    }
    return null;
  }
  @action
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor informe uma senha de 6 dígitos';
    }
    return null;
  }
  //computeds
  @computed
  bool get isNameValid => name.length > 3;
  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  @computed
  bool get isPhoneNumberValid => phoneNumber.length == 9;
  @computed
  bool get isPasswordValid => password.length == 6;
  @computed
  bool get isConfirmPasswordValid => confirmPassword.length == 6;
  @computed 
  bool get loading =>!isLoading;
  @computed 
  bool get isFormValid=> isNameValid || isEmailValid || isPhoneNumberValid && isPhoneNumberValid || isPasswordValid || isConfirmPasswordValid;
}
