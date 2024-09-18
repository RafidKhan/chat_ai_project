import 'package:flutter/material.dart';

@immutable
class SignInState {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isObscurePassword;
  final bool isButtonEnabled;
  final bool isMobileNumberFieldEnabled;

  const SignInState({
    required this.emailController,
    required this.passwordController,
    required this.isObscurePassword,
    required this.isButtonEnabled,
    required this.isMobileNumberFieldEnabled,
  });

  SignInState copyWith({
    bool? isObscurePassword,
    bool? isButtonEnabled,
    bool? isMobileNumberFieldEnabled,
  }) {
    return SignInState(
      emailController: emailController,
      passwordController: passwordController,
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      isMobileNumberFieldEnabled: isMobileNumberFieldEnabled ?? this.isMobileNumberFieldEnabled,
    );
  }
}
