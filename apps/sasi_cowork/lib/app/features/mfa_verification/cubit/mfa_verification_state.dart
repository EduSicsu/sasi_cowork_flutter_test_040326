import 'package:equatable/equatable.dart';

sealed class MfaVerificationState extends Equatable {
  const MfaVerificationState();

  @override
  List<Object?> get props => [];
}

class MfaVerificationInitial extends MfaVerificationState {
  const MfaVerificationInitial();
}

class MfaVerificationVerifying extends MfaVerificationState {
  const MfaVerificationVerifying();
}

class MfaVerificationSuccess extends MfaVerificationState {
  const MfaVerificationSuccess();
}

class MfaVerificationFailure extends MfaVerificationState {
  const MfaVerificationFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
