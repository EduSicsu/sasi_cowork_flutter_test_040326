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
      _emailError = email.isEmpty ? 'Informe o e-mail' : null;
      _passwordError = password.isEmpty ? 'Informe a senha' : null;
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MoniTextField(
          label: 'E-mail',
          hint: 'seu@email.com',
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
        MoniTextField(
          label: 'Senha',
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
        const SizedBox(height: AppTokens.spaceSm),
        Align(
          alignment: Alignment.centerRight,
          child: MoniButton.textPrimary(
            label: 'Esqueceu a senha?',
            size: MoniButtonSize.small,
            onPressed: () {},
          ),
        ),
        const SizedBox(height: AppTokens.spaceXl),
        MoniButton.filled(
          label: 'Entrar',
          size: MoniButtonSize.large,
          isFullWidth: true,
          isLoading: isLoading,
          onPressed: isLoading ? null : _submit,
        ),
      ],
    );
  }
}
