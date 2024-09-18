import 'package:flutter/material.dart';

@immutable
class RegistrationState {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final bool isButtonEnabled;

  const RegistrationState({
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.password,
    required this.confirmPassword,
    required this.isPasswordVisible,
    required this.isConfirmPasswordVisible,
    required this.isButtonEnabled,
  });

  RegistrationState copyWith({
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    bool? isButtonEnabled,
  }) {
    return RegistrationState(
      firstNameController: firstNameController,
      lastNameController: lastNameController,
      emailController: emailController,
      phoneController: phoneController,
      password: password,
      confirmPassword: confirmPassword,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}
