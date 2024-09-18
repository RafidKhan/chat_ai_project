import 'dart:io';

import 'package:chat_on/constant/app_url.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:dio/dio.dart';

import '/data_provider/api_client.dart';

class ChatThreadApi {
  final ApiClient _apiClient = ApiClient();

  ChatThreadApi();

  Future<void> chatWithAi({
    required Map<String, dynamic> params,
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      url: AppUrl.chatWithAi.url,
      method: Method.POST,
      params: params,
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: false,
    );
  }

  Future<void> uploadImage({
    required File imageFile,
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.requestFormData(
      url: AppUrl.fileUpload.url,
      method: Method.POST,
      files: [
        imageFile
      ],
      fileKeyName: "file",
      params: {},
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: true,
    );
  }
}
