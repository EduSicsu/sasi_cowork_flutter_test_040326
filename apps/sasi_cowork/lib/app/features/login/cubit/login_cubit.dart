import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/services/auth_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authService) : super(const LoginInitial());

  final AuthService _authService;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const LoginLoading());
    try {
      final auth = await _authService.login(
        email: email,
        password: password,
      );

      if (auth.requiresMfa) {
        emit(
          LoginMfaRequired(
            tempAccessToken: auth.accessToken,
            mfaType: auth.mfaType!,
          ),
        );
      } else {
        emit(const LoginSuccess());
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
