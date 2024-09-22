import 'package:chat_on/constant/app_url.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:dio/dio.dart';
import '/data_provider/api_client.dart';

class ChatsApi {
  final ApiClient _apiClient = ApiClient();

  ChatsApi();

  Future<void> getFreeAiPrompts({
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      url: AppUrl.freeAiPrompts.url,
      method: Method.GET,
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: false,
    );
  }

  Future<void> getPaidAiPrompts({
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      url: AppUrl.paidAiPrompts.url,
      method: Method.GET,
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: false,
    );
  }

  Future<void> getCategoryWiseAiPrompts({
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      url: AppUrl.categoryWiseAiPrompts.url,
      method: Method.GET,
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: false,
    );
  }
}
