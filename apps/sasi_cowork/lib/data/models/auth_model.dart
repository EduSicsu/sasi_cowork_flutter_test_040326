import '../../domain/entities/auth_entity.dart';

class AuthMfaModel {
  const AuthMfaModel({required this.type, required this.isActive});

  factory AuthMfaModel.fromJson(Map<String, dynamic> json) => AuthMfaModel(
        type: json['type'] as String,
        isActive: (json['isActive'] as bool?) ?? false,
      );

  final String type;
  final bool isActive;

  Map<String, dynamic> toJson() => {'type': type, 'isActive': isActive};

  AuthMfaEntity toEntity() => AuthMfaEntity(type: type, isActive: isActive);
}

class AuthModel {
  const AuthModel({
    required this.accessToken,
    this.refreshToken,
    this.permissions = const [],
    this.mfaType,
    this.mfas = const [],
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String?,
        permissions: (json['permissions'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        mfaType: json['mfaType'] as String?,
        mfas: (json['mfas'] as List<dynamic>?)
                ?.map(
                  (e) => AuthMfaModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      );

  final String accessToken;
  final String? refreshToken;
  final List<String> permissions;
  final String? mfaType;
  final List<AuthMfaModel> mfas;

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        if (refreshToken != null) 'refreshToken': refreshToken,
        'permissions': permissions,
        if (mfaType != null) 'mfaType': mfaType,
        'mfas': mfas.map((m) => m.toJson()).toList(),
      };

  AuthEntity toEntity() => AuthEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
        permissions: permissions,
        mfaType: mfaType,
        mfas: mfas.map((m) => m.toEntity()).toList(),
      );

  static AuthModel fromEntity(AuthEntity entity) => AuthModel(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        permissions: entity.permissions,
        mfaType: entity.mfaType,
        mfas: entity.mfas
            .map((e) => AuthMfaModel(type: e.type, isActive: e.isActive))
            .toList(),
      );
}

extension AuthModelListExtension on List<AuthModel> {
  List<AuthEntity> toEntities() => map((m) => m.toEntity()).toList();
}
