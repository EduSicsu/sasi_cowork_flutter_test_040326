import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sume_design_system/sume_design_system.dart';
import '../home/home_page.dart';
import 'cubit/cubit.dart';
import 'widgets/mfa_code_input.dart';

class MfaVerificationPage extends StatelessWidget {
  const MfaVerificationPage({
    super.key,
    required this.mfaType,
  });

  final String mfaType;

  static const routeName = '/mfa-verification';

  static Widget build(BuildContext context, {Object? arguments}) {
    final args = (arguments as Map<String, dynamic>?) ?? {};
    final mfaType = args['mfaType'] as String? ?? 'email';
    return BlocProvider(
      create: (_) => GetIt.I<MfaVerificationCubit>(),
      child: MfaVerificationPage(mfaType: mfaType),
    );
  }

  static void navigate(
    BuildContext context, {
    required String tempAccessToken,
    required String mfaType,
  }) =>
      Navigator.of(context).pushNamed(
        routeName,
        arguments: {
          'tempAccessToken': tempAccessToken,
          'mfaType': mfaType,
        },
      );

  static void replace(
    BuildContext context, {
    required String tempAccessToken,
    required String mfaType,
  }) =>
      Navigator.of(context).pushReplacementNamed(
        routeName,
        arguments: {
          'tempAccessToken': tempAccessToken,
          'mfaType': mfaType,
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<MfaVerificationCubit, MfaVerificationState>(
      listener: _handleState,
      child: Scaffold(
        appBar: AppBar(title: const Text('Verificação')),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTokens.spaceLg,
              vertical: AppTokens.spaceXl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppTokens.spaceLg),
                Text(
                  'Verificação em duas etapas',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTokens.spaceSm),
                Text(
                  _mfaDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTokens.spaceXxl),
                MfaCodeInput(mfaType: mfaType),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get _mfaDescription => switch (mfaType) {
        'email' => 'Digite o código enviado para o seu e-mail.',
        'phone' => 'Digite o código enviado por SMS.',
        'authenticator' => 'Digite o código do seu aplicativo autenticador.',
        _ => 'Digite o código de verificação.',
      };

  void _handleState(BuildContext context, MfaVerificationState state) {
    if (state is MfaVerificationFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: AppColors.error,
        ),
      );
    }

    if (state is MfaVerificationSuccess) {
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    }
  }
}
