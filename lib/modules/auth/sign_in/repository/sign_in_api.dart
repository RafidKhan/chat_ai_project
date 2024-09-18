import 'package:chat_on/constant/app_url.dart';
import 'package:chat_on/modules/auth/sign_in/model/sign_in_request.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:dio/dio.dart';

import '/data_provider/api_client.dart';

class SignInApi {
  final ApiClient _apiClient = ApiClient();

  SignInApi();

  Future<void> signIn({
    required Map<String, dynamic> params,
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      url: AppUrl.signIn.url,
      method: Method.POST,
      params: params,
      isPopGlobalDialog: true,
      onSuccessFunction: onSuccess,
    );
  }
}
