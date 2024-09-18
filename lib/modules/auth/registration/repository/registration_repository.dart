import 'dart:convert';

import 'package:chat_on/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:chat_on/modules/auth/registration/model/registration_request.dart';
import 'package:chat_on/modules/auth/registration/model/registration_response.dart';
import 'package:chat_on/modules/auth/registration/repository/registration_api.dart';

import 'registration_interface.dart';

class RegistrationRepository implements IRegistrationRepository {
  final RegistrationApi _api = RegistrationApi();

  @override
  Future requestRegistration({
    required RegistrationRequest registrationRequest,
    required Function(SignUpResponse response) onSuccess,
  }) async {
    await _api.requestRegistration(
      model: registrationRequest,
      onSuccess: (response) {
        'data::A:: ${SignUpResponse.fromJson(response.data).toJson()}'.log();
        'data::B:: ${jsonEncode(response.data)}'.log();
        onSuccess(SignUpResponse.fromJson(response.data));
      },
    );
  }
}
