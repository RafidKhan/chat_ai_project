import 'package:chat_on/utils/enum.dart';
import 'package:dio/dio.dart';
import '../../../constant/app_url.dart';
import '/data_provider/api_client.dart';

class HistoryApi {
  final ApiClient _apiClient = ApiClient();

  HistoryApi();

  Future getAllHistory({
    required Function(Response response) response
  }) async{
    await _apiClient.request(
        url: AppUrl.allHistory.url,
        method: Method.GET,
        onSuccessFunction: response,
        isPopGlobalDialog: false,
    );
  }
}

