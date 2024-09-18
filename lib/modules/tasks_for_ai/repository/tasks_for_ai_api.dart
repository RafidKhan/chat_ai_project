import 'package:dio/dio.dart';
import '../../../constant/app_url.dart';
import '../../../utils/enum.dart';
import '/data_provider/api_client.dart';

class TasksForAiApi {
  final ApiClient _apiClient = ApiClient();

  TasksForAiApi();

  Future<void> getTagWiseAiPrompts({
    required String tagId,
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      url: AppUrl.tagWisePrompts.url.replaceAll("{TAG_ID}", tagId),
      method: Method.GET,
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: false,
    );
  }

  Future<void> getFavouriteAiPrompts({
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      url: AppUrl.favouritePromptAddDelete.url,
      method: Method.GET,
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: false,
    );
  }

  Future<void> setFavouritePrompt({
    required String promptId,
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      url: AppUrl.favouritePromptAddDelete.url,
      method: Method.POST,
      params: {
        "promptId": promptId,
      },
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: true,
    );
  }

  Future<void> deleteFavouritePrompt({
    required String promptId,
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      url: "${AppUrl.favouritePromptAddDelete.url}/$promptId",
      method: Method.DELETE,
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: true,
    );
  }

  Future<void> getPromptTags({
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient.request(
      url: AppUrl.promptTags.url,
      method: Method.GET,
      onSuccessFunction: onSuccess,
      isPopGlobalDialog: false,
    );
  }
}
