import 'package:chat_on/constant/constant_key.dart';
import 'package:chat_on/data_provider/pref_helper.dart';
import 'package:chat_on/modules/auth/sign_in/controller/state/sign_in_state.dart';
import 'package:chat_on/modules/auth/sign_in/model/sign_in_request.dart';
import 'package:chat_on/utils/app_routes.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:flutter/foundation.dart';
import '../repository/sign_in_interface.dart';
import '../repository/sign_in_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInController =
    StateNotifierProvider.autoDispose<SignInController, SignInState>(
        (ref) => SignInController());

class SignInController extends StateNotifier<SignInState> {
  final ISignInRepository _signinRepository = SignInRepository();

  SignInController()
      : super(
          SignInState(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            // emailController: TextEditingController(text: "abul@gmail.com"),
            // passwordController: TextEditingController(text: "Abcd123!"),
            isObscurePassword: true,
            isButtonEnabled: false,
            isMobileNumberFieldEnabled: true,
          ),
        ) {
    state.emailController.addListener(() {
      checkButtonStatus();
    });
    state.passwordController.addListener(() {
      checkButtonStatus();
    });
    if(kDebugMode){
      state.emailController.text = 'shuvo@gmail.com';
      state.passwordController.text = '123456';
    }
  }

  checkButtonStatus() {
    final String email = state.emailController.text.trim();
    final String password = state.passwordController.text.trim();
    bool isButtonEnabled = false;
    if (email.isNotEmpty && email.isValidEmail && password.isNotEmpty) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
    state = state.copyWith(isButtonEnabled: isButtonEnabled);
  }

  togglePasswordVisibility() {
    state = state.copyWith(isObscurePassword: !state.isObscurePassword);
  }

  Future<void> signIn(BuildContext context) async {
    ViewUtil.showLoader();
    final params = SignInRequest(
      email: state.emailController.text.trim(),
      password: state.passwordController.text.trim(),
    );
    await _signinRepository.signIn(
      params: params,
      onSuccess: (response) async {
        Navigation.pop(context);
        await PrefHelper.setInt(AppConstant.AVAILABLE_TOKEN.key, response.availableToken!);
        await PrefHelper.setString(AppConstant.USER_TYPE.key, response.userType!);
        await PrefHelper.setString(AppConstant.TOKEN.key, response.token ?? "")
            .then((e) {
          Navigation.pushAndRemoveUntil(
            context,
            appRoutes: AppRoutes.dashboard,
          );
        });
      },
    );
  }
}
