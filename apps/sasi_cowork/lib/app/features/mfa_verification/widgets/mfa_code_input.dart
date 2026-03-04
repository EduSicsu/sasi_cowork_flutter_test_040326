import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sume_design_system/sume_design_system.dart';
import '../cubit/cubit.dart';

class MfaCodeInput extends StatefulWidget {
  const MfaCodeInput({super.key, required this.mfaType});

  final String mfaType;

  @override
  State<MfaCodeInput> createState() => _MfaCodeInputState();
}

class _MfaCodeInputState extends State<MfaCodeInput> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<MfaVerificationCubit>().verify(
            code: _controller.text.trim(),
            mfaType: widget.mfaType,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isVerifying = context.select(
      (MfaVerificationCubit c) => c.state is MfaVerificationVerifying,
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 6,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  letterSpacing: AppTokens.spaceMd,
                ),
            decoration: const InputDecoration(
              hintText: '000000',
              counterText: '',
            ),
            validator: (v) =>
                (v == null || v.trim().length < 4) ? 'Código inválido' : null,
          ),
          const SizedBox(height: AppTokens.spaceLg),
          FilledButton(
            onPressed: isVerifying ? null : _submit,
            child: isVerifying
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Verificar'),
          ),
        ],
      ),
    );
  }
}
