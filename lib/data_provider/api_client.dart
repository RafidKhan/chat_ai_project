import 'dart:convert';
import 'dart:io';

import 'package:chat_on/constant/app_url.dart';
import 'package:chat_on/constant/constant_key.dart';
import 'package:chat_on/data_provider/pref_helper.dart';
import 'package:chat_on/global/model/global_response.dart';
import 'package:chat_on/global/widget/error_dialog.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/network_connection.dart';
import 'package:chat_on/utils/view_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final Dio _dio = Dio();
  Map<String, dynamic> _header = {};
  bool? isPopDialog;

  _initDio({Map<String, String>? extraHeader}) async {
    _header = _getHeaders();
    if (extraHeader != null) {
      _header.addAll(extraHeader);
    }

    _dio.options = BaseOptions(
      baseUrl: AppUrl.base.url,
      headers: _header,
      connectTimeout: const Duration(milliseconds: 60 * 1000),
      //miliseconds
      sendTimeout: const Duration(milliseconds: 60 * 1000),
      receiveTimeout: const Duration(milliseconds: 60 * 1000),
    );
    _initInterceptors();
  }

  void _initInterceptors() {
    // _dio.interceptors.add(PrettyDioLogger(
    // requestHeader: !kReleaseMode,
    //   requestBody: !kReleaseMode,
    //       responseBody: !kReleaseMode,
    // ));
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      debugPrint(
          'REQUEST[${options.method}] => PATH: ${AppUrl.base.url}${options.path} '
          '=> Request Values: param: ${options.queryParameters}, DATA: ${options.data}, => _HEADERS: ${options.headers}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      (
          'RESPONSE[${response.statusCode}] => DATA: ${jsonEncode(response.data)} URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}').log();
      return handler.next(response);
    }, onError: (err, handler) {
      debugPrint(
          'ERROR[${err.response?.statusCode}] => DATA: ${err.response?.data} Message: ${err.message} URL: ${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}');
      return handler.next(err);
    }));
  }

  // Image or file upload using Rest handle.
  Future requestFormData({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
    bool? isPopGlobalDialog,
    String? token,
    Options? options,
    void Function(int, int)? onReceiveProgress,
    String? savePath,
    List<File>? files,
    String? fileKeyName,
    required Function(
      Response response,
    ) onSuccessFunction,
  }) async {
    final tokenHeader = <String, String>{
      HttpHeaders.contentTypeHeader: AppConstant.MULTIPART_FORM_DATA.key
    };
    _initDio(extraHeader: tokenHeader);

    if (files != null) {
      params?.addAll({
        "${fileKeyName}": files
            .map((item) => MultipartFile.fromFileSync(item.path,
                filename: item.path.split('/').last))
            .toList()
      });
    }

    final data = FormData.fromMap(params!);
    data.log();
    // Handle and check all the status.
    return clientHandle(
      url,
      method,
      params,
      data: data,
      onSuccessFunction: onSuccessFunction,
    );
  }

  // Normal Rest API  handle.
  Future request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
    bool? isPopGlobalDialog,
    String? token,
    Options? options,
    void Function(int, int)? onReceiveProgress,
    String? savePath,
    Map<String, String>? extraHeaders,
    required Function(Response response) onSuccessFunction,
  }) async {
    //use this for extra header
    final tokenHeader = <String, String>{
      //  AppConstant.PUSH_ID.key: PrefHelper.getString(AppConstant.DEVICE_ID.key),
    };

    if (extraHeaders != null) {
      tokenHeader.addAll(extraHeaders);
    }

    if (NetworkConnection.instance.isInternet) {
      // Handle and check all the status.
      isPopDialog = isPopGlobalDialog;
      _initDio(extraHeader: tokenHeader);
      // checkProxy();
      return clientHandle(
        url,
        method,
        params,
        data: params,
        options: options,
        savePath: savePath,
        onReceiveProgress: onReceiveProgress,
        onSuccessFunction: onSuccessFunction,
      );
    } else {
      _handleNoInternet(
        apiParams: APIParams(
          url: url,
          method: method,
          variables: params ?? {},
          onSuccessFunction: onSuccessFunction,
        ),
      );
    }
  }

// Handle all the method and error.
  Future clientHandle(
    String url,
    Method method,
    Map<String, dynamic>? params, {
    dynamic data,
    Options? options,
    String? savePath,
    void Function(int, int)? onReceiveProgress,
    required Function(Response response)? onSuccessFunction,
  }) async {
    Response response;
    try {
      // Handle response code from api.
      if (method == Method.POST) {
        response = await _dio.post(
          url,
          //queryParameters: params,
          data: data,
        );
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else if (method == Method.DOWNLOAD) {
        response = await _dio.download(
          url,
          savePath,
          queryParameters: params,
          options: options,
          onReceiveProgress: onReceiveProgress,
        );
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
          options: options,
          onReceiveProgress: onReceiveProgress,
        );
      }
      /**
       * Handle Rest based on response json
       * So please check in json body there is any status_code or code
       */
      _handleResponse(
        response: response,
        onSuccessFunction: onSuccessFunction,
      );

      // Handle Error type if dio catches anything.
    } on DioError catch (e) {
      String error = "";
      try {
        error = GlobalResponse.fromJson(e.response?.data).message ?? "";
      } catch (e) {
        error = "Server Error";
      }
      return showSnackBarAndPopLoader(
        error,
      );
    } catch (e) {
      return showSnackBarAndPopLoader("Something Went Wrong");
    }
  }

  Map<String, String> _getHeaders() {
    return {
      "accept": "*/*",
      //"content-length": "475",
      "Content-Type": "application/json",
      "authorization" : "Bearer ${PrefHelper.getString(AppConstant.TOKEN.key)}"
      //"date": "Tue, 25 Jun 2024 15:05:26 GMT",
      //"etag": "W/\"1db-EixRDcompC5MZKp646goI2JWhl4\"",
      //"keep-alive": "timeout=5",
      //"x-powered-by": "Express"
    };

    final DEVISE_OS =
        Platform.isAndroid ? AppConstant.ANDROID.key : AppConstant.IOS.key;

    return {
      HttpHeaders.contentTypeHeader: AppConstant.APPLICATION_JSON.key,
      HttpHeaders.authorizationHeader:
          "${AppConstant.BEARER.key} ${PrefHelper.getString(AppConstant.TOKEN.key)}",
      AppConstant.APP_VERSION.key:
          PrefHelper.getString(AppConstant.APP_VERSION.key),
      AppConstant.BUILD_NUMBER.key:
          PrefHelper.getString(AppConstant.BUILD_NUMBER.key),
      AppConstant.DEVICE_OS.key: DEVISE_OS,
      AppConstant.LANGUAGE.key: PrefHelper.getLanguage() == 1
          ? AppConstant.EN.key
          : AppConstant.BN.key,
      AppConstant.DEVICE_ID.key:
          PrefHelper.getString(AppConstant.DEVICE_ID.key),
    };
    return {
      "connection": "keep-alive",
      "content-length": "475",
      "content-type": "application/json; charset=utf-8",
      //"date": "Tue, 25 Jun 2024 15:05:26 GMT",
      "etag": "W/\"1db-EixRDcompC5MZKp646goI2JWhl4\"",
      "keep-alive": "timeout=5",
      "x-powered-by": "Express"
    };
  }

  void _handleNoInternet({
    required APIParams apiParams,
  }) {
    NetworkConnection.instance.apiStack.add(apiParams);

    if (ViewUtil.isPresentedDialog == false) {
      ViewUtil.isPresentedDialog = true;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ViewUtil.showInternetDialog(
            onPressed: () {
              if (NetworkConnection.instance.isInternet == true) {
                Navigator.of(Navigation.key.currentState!.overlay!.context,
                        rootNavigator: true)
                    .pop();
                ViewUtil.isPresentedDialog = false;
                NetworkConnection.instance.apiStack.forEach(
                  (element) {
                    request(
                      url: element.url,
                      method: element.method,
                      params: element.variables,
                      onSuccessFunction: element.onSuccessFunction,
                    );
                  },
                );
                NetworkConnection.instance.apiStack = [];
              }
            },
          );
        },
      );
    }
  }

  Future<void> _handleResponse({
    required Response response,
    required Function(Response response)? onSuccessFunction,
  }) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map data = json.decode(response.toString());
      // TODO:  please replace this code based on your reponse.
      final verifycode = data['status'];
      int code = int.tryParse(verifycode.toString()) ?? 0;
      if (code == 200 || code == 201) {
        if (response.data != null) {
          return onSuccessFunction!(response);
        } else {
          return showSnackBarAndPopLoader("Something Went Wrong");
        }
      } else {
        final String message = data['message'];
        //Where error occured then pop the global dialog

        ViewUtil.showAlertDialog(
          barrierDismissible: false,
          contentPadding: EdgeInsets.zero,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
          content: ErrorDialog(
            erroMsg: [message],
          ),
        ).then((value) {
          if (isPopDialog != false) {
            Navigator.pop(Navigation.key.currentContext!);
          }
        });
      }
    }
  }

  showSnackBarAndPopLoader(String message) {
    // if (isPopDialog != false) {
    //   Navigation.pop(Navigation.key.currentContext);
    // }
    // ViewUtil.SSLSnackbar(message);
    if (isPopDialog != false) {
      Navigator.pop(Navigation.key.currentContext!);
    }
    ViewUtil.showAlertDialog(
      barrierDismissible: false,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(20.r),
      ),
      content: ErrorDialog(
        erroMsg: [message],
      ),
    );
  }
}
