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
    return BlocListener<LoginCubit, LoginState>(
      listener: _handleState,
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: _LoginBody(),
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

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: screenHeight * 0.43,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/login_background.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.5, 1.0],
                    colors: [Colors.transparent, Colors.white],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppTokens.spaceXxl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome to SASI System',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppTokens.spaceXs),
                Text(
                  'Keep up to date with messages and alerts.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: SumePrimitives.gray500,
                      ),
                ),
                const SizedBox(height: AppTokens.spaceXxl),
                const LoginForm(),
                const SizedBox(height: AppTokens.spaceLg),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
