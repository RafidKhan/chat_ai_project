import 'package:flutter/material.dart';
import 'package:chat_on/modules/auth/registration/model/registration_request.dart';
import 'package:chat_on/modules/auth/registration/model/registration_response.dart';

@immutable
abstract class IRegistrationRepository {
  Future requestRegistration({
    required RegistrationRequest registrationRequest,
    required Function(SignUpResponse response) onSuccess,
  });
}
