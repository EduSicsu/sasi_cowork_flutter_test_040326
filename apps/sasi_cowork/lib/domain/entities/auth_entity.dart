import 'package:equatable/equatable.dart';

class AuthMfaEntity extends Equatable {
  const AuthMfaEntity({required this.type, required this.isActive});

  final String type;
  final bool isActive;

  @override
  List<Object?> get props => [type, isActive];
}

class AuthEntity extends Equatable {
  const AuthEntity({
    required this.accessToken,
    this.refreshToken,
    this.permissions = const [],
    this.mfaType,
    this.mfas = const [],
  });

  final String accessToken;
  final String? refreshToken;
  final List<String> permissions;

  /// Present when a second factor is required to complete authentication.
  final String? mfaType;

  final List<AuthMfaEntity> mfas;

  bool get requiresMfa => mfaType != null;

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        permissions,
        mfaType,
        mfas,
      ];
}
