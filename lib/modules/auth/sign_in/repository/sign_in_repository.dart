import 'package:chat_on/modules/auth/sign_in/repository/sign_in_api.dart';

import '../model/login_response.dart';
import '../model/sign_in_request.dart';
import 'sign_in_interface.dart';

class SignInRepository implements ISignInRepository {
  final SignInApi _api = SignInApi();

  @override
  Future<void> signIn({
    required SignInRequest params,
    required Function(LoginResponse response) onSuccess,
  }) async {
    await _api.signIn(
      params: params.toJson(),
      onSuccess: (response) {
        onSuccess(LoginResponse.fromJson(response.data));
      },
    );
  }
}
