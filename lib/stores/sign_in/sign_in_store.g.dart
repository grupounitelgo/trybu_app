// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on _SignInStore, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_SignInStore.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_SignInStore.isPasswordValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignInStore.isFormValid'))
          .value;
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_SignInStore.loading'))
      .value;

  late final _$emailAtom = Atom(name: '_SignInStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignInStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordVisibleAtom =
      Atom(name: '_SignInStore.passwordVisible', context: context);

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SignInStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_SignInStoreActionController =
      ActionController(name: '_SignInStore', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePassword() {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.togglePassword');
    try {
      return super.togglePassword();
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String? value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePassword(String? value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordVisible: ${passwordVisible},
isLoading: ${isLoading},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isFormValid: ${isFormValid},
loading: ${loading}
    ''';
  }
}
