import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sume_design_system/sume_design_system.dart';
import '../cubit/cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validate() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    setState(() {
      _emailError = email.isEmpty ? 'Please enter your email' : null;
      _passwordError = password.isEmpty ? 'Please enter your password' : null;
    });

    return _emailError == null && _passwordError == null;
  }

  void _submit() {
    if (_validate()) {
      context.read<LoginCubit>().login(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (LoginCubit c) => c.state is LoginLoading,
    );
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Email',
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppTokens.spaceXs),
        MoniTextField(
          hint: 'Enter email',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          size: MoniTextFieldSize.xl,
          state: _emailError != null
              ? MoniTextFieldState.negative
              : MoniTextFieldState.normal,
          supportingText: _emailError,
          autofillHints: const [AutofillHints.email],
          onChanged: (_) {
            if (_emailError != null) setState(() => _emailError = null);
          },
        ),
        const SizedBox(height: AppTokens.spaceMd),
        Text(
          'Password',
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppTokens.spaceXs),
        MoniTextField(
          hint: 'Enter password',
          controller: _passwordController,
          obscureText: true,
          textInputAction: TextInputAction.done,
          size: MoniTextFieldSize.xl,
          state: _passwordError != null
              ? MoniTextFieldState.negative
              : MoniTextFieldState.normal,
          supportingText: _passwordError,
          autofillHints: const [AutofillHints.password],
          onSubmitted: (_) => _submit(),
          onChanged: (_) {
            if (_passwordError != null) setState(() => _passwordError = null);
          },
        ),
        const SizedBox(height: AppTokens.spaceXl),
        MoniButton.filled(
          label: 'Log in',
          size: MoniButtonSize.large,
          isFullWidth: true,
          isLoading: isLoading,
          onPressed: isLoading ? null : _submit,
        ),
        const SizedBox(height: AppTokens.spaceMd),
        Center(
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Reset password',
              style: textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppTokens.spaceSm),
        Center(
          child: Text.rich(
            TextSpan(
              text: "Don't have an account? ",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: SumePrimitives.gray500,
                  ),
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Register',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: SumePrimitives.indigo600,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: SumePrimitives.indigo600,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 75),
      ],
    );
  }
}
