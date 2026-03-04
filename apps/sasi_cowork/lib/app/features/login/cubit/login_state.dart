import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginMfaRequired extends LoginState {
  const LoginMfaRequired({
    required this.tempAccessToken,
    required this.mfaType,
  });

  final String tempAccessToken;
  final String mfaType;

  @override
  List<Object?> get props => [tempAccessToken, mfaType];
}

class LoginFailure extends LoginState {
  const LoginFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
