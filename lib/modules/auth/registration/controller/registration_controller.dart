import 'dart:async';

import 'package:chat_on/modules/auth/registration/model/registration_request.dart';
import 'package:chat_on/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_on/modules/auth/registration/controller/state/registration_state.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/view_util.dart';
import '../repository/registration_interface.dart';
import '../repository/registration_repository.dart';

final registrationController =
    StateNotifierProvider<RegistrationController, RegistrationState>(
        (ref) => RegistrationController());

class RegistrationController extends StateNotifier<RegistrationState> {
  final IRegistrationRepository _registrationRepository =
      RegistrationRepository();

  RegistrationController()
      : super(RegistrationState(
          firstNameController: TextEditingController(),
          lastNameController: TextEditingController(),
          emailController: TextEditingController(),
          phoneController: TextEditingController(),
          password: TextEditingController(),
          confirmPassword: TextEditingController(),
          isPasswordVisible: false,
          isConfirmPasswordVisible: false,
          isButtonEnabled: false,
        )) {
    state.firstNameController.addListener(() {
      checkButtonStatus();
    });
    state.lastNameController.addListener(() {
      checkButtonStatus();
    });
    state.emailController.addListener(() {
      checkButtonStatus();
    });
    state.phoneController.addListener(() {
      checkButtonStatus();
    });
    state.password.addListener(() {
      checkButtonStatus();
    });
    state.confirmPassword.addListener(() {
      checkButtonStatus();
    });
  }

  checkButtonStatus() {
    final bool isValidEmail = state.emailController.text.trim().isNotEmpty &&
        state.emailController.text.trim().isValidEmail;
    final bool isValidPhone = state.phoneController.text.trim().isNotEmpty;
    final bool isValidName = state.firstNameController.text.trim().isNotEmpty &&
        state.lastNameController.text.trim().isNotEmpty;

    final bool isValidPassword = state.password.text.trim().isNotEmpty;

    final bool isValidConfirmPassword =
        (state.password.text.trim() == state.confirmPassword.text.trim());
    final bool buttonStatus = (isValidName &&
        isValidEmail &&
        isValidPhone &&
        isValidPassword &&
        isValidConfirmPassword);
    state = state.copyWith(isButtonEnabled: buttonStatus);
  }

  togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  toggleConfirmPasswordVisibility() {
    state = state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible);
  }

  Future<void> requestSignUp(BuildContext context) async {
    ViewUtil.showLoader();
    final fullName =
        "${state.firstNameController.text.trim()} ${state.lastNameController.text.trim()}";
    final params = RegistrationRequest(
      fullName: fullName,
      email: state.emailController.text.trim(),
      phoneNumber: state.phoneController.text.trim(),
      password: state.password.text.trim(),
    );
    await _registrationRepository.requestRegistration(
      registrationRequest: params,
      onSuccess: (response) {
        Navigation.pop(context);
        final message = response.message;
        if (message != null) {
          ViewUtil.SSLSnackbar(message);
        }
        Navigation.pushAndRemoveUntil(
          context,
          appRoutes: AppRoutes.signIn,
        );
      },
    );
  }
}
