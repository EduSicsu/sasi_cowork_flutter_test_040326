import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sume_design_system/sume_design_system.dart';
import '../home/home_page.dart';
import '../mfa_verification/mfa_verification_page.dart';
import 'cubit/cubit.dart';
import 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  static Widget pageBuilder(BuildContext context, {Object? arguments}) {
    return BlocProvider(
      create: (_) => GetIt.I<LoginCubit>(),
      child: const LoginPage(),
    );
  }

  static void navigate(BuildContext context) =>
      Navigator.of(context).pushNamed(routeName);

  static void replace(BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(routeName);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<SumeThemeExtension>()!;

    return BlocListener<LoginCubit, LoginState>(
      listener: _handleState,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTokens.spaceLg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppTokens.space6xl),
                Center(
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: cs.primary,
                      borderRadius:
                          BorderRadius.circular(AppTokens.radiusXl),
                    ),
                    child: Icon(
                      Icons.account_balance_wallet_outlined,
                      color: cs.onPrimary,
                      size: AppTokens.iconXxl,
                    ),
                  ),
                ),
                const SizedBox(height: AppTokens.spaceXxl),
                Text(
                  'Bem-vindo ao Moni',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTokens.spaceSm),
                Text(
                  'Faça login para continuar',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ext.textSubtitle,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTokens.space3xl),
                const LoginForm(),
                const SizedBox(height: AppTokens.spaceXxl),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleState(BuildContext context, LoginState state) {
    if (state is LoginFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }

    if (state is LoginMfaRequired) {
      Navigator.of(context).pushReplacementNamed(
        MfaVerificationPage.routeName,
        arguments: {
          'tempAccessToken': state.tempAccessToken,
          'mfaType': state.mfaType,
        },
      );
    }

    if (state is LoginSuccess) {
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    }
  }
}
