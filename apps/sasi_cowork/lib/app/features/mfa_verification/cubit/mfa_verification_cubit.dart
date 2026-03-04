import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/services/auth_service.dart';
import 'mfa_verification_state.dart';

class MfaVerificationCubit extends Cubit<MfaVerificationState> {
  MfaVerificationCubit(this._authService)
      : super(const MfaVerificationInitial());

  final AuthService _authService;

  Future<void> verify({
    required String code,
    required String mfaType,
  }) async {
    emit(const MfaVerificationVerifying());
    try {
      await _authService.verifyMfa(code: code, mfaType: mfaType);
      emit(const MfaVerificationSuccess());
    } catch (e) {
      emit(MfaVerificationFailure(message: e.toString()));
    }
  }
}
