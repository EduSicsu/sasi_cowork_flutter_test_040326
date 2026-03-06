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
    return Stack(
      children: [
        // Back layer: image + gradient (under the form)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 396.0,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/login_background.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.74],
                    colors: [
                      const Color(0x00000000),
                      Theme.of(context).colorScheme.surfaceContainerLowest,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Front layer: container with texts and buttons (on top of the stack above)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: AppTokens.spaceXxl,
              right: AppTokens.spaceXxl,
              bottom: MediaQuery.of(context).viewPadding.bottom + 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 396.0),
                Text(
                  'Welcome to SASI System',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: AppTokens.spaceXs),
                Text(
                  'Keep up to date with messages and alerts.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: AppTokens.spaceXxl),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
