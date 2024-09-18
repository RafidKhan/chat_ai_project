import 'package:dio/dio.dart';
import 'package:chat_on/constant/app_url.dart';
import 'package:chat_on/modules/auth/registration/model/registration_request.dart';
import 'package:chat_on/utils/enum.dart';

import '/data_provider/api_client.dart';

class RegistrationApi {
  final ApiClient _apiClient = ApiClient();

  RegistrationApi();

  Future requestRegistration({
    required RegistrationRequest model,
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      method: Method.POST,
      url: AppUrl.signUp.url,
      params: model.toJson(),
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: true,
    );
  }
}
