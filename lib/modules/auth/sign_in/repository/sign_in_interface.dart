import 'package:chat_on/global/model/global_response.dart';
import 'package:chat_on/modules/auth/sign_in/model/sign_in_request.dart';
import 'package:flutter/material.dart';

import '../model/login_response.dart';

@immutable
abstract class ISignInRepository {
  Future<void> signIn({
    required SignInRequest params,
    required Function(LoginResponse response) onSuccess,
  });
}
