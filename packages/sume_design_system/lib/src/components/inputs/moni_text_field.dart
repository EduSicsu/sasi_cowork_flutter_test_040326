import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_tokens.dart';
import '../../theme/app_typography.dart';
import '../../theme/sume_theme_extension.dart';

// ---------------------------------------------------------------------------
// Enums
// ---------------------------------------------------------------------------

/// Size of a [MoniTextField].
///
/// Matches the Figma `Size` property:
/// - [small] — compact 40 px height
/// - [large] — standard 48 px height (default)
/// - [xl] — expanded 56 px height
enum MoniTextFieldSize { small, large, xl }

/// Validation state of a [MoniTextField].
///
/// Affects border colour, helper icon, and supporting text colour.
enum MoniTextFieldState {
  /// Default idle state.
  normal,

  /// Filled / has content (no extra styling beyond normal).
  filled,

  /// Focused — primary-coloured border.
  focused,

  /// Validation passed — green border + check icon.
  positive,

  /// Validation failed — red border + error icon.
  negative,

  /// Read-only (view only) — no interaction possible.
  viewOnly,

  /// Disabled — muted colours, pointer events disabled.
  disabled,
}

// ---------------------------------------------------------------------------
// MoniTextField
// ---------------------------------------------------------------------------

/// Moni Design System text input.
///
/// Wraps Flutter's [TextField] with Moni theming and exposes states matching
/// the Figma `text_group` component set.
///
/// Usage:
/// ```dart
/// MoniTextField(
///   label: 'Email',
///   hint: 'you@example.com',
///   controller: _emailCtrl,
/// )
/// MoniTextField(
///   label: 'Password',
///   state: MoniTextFieldState.negative,
///   supportingText: 'Wrong password',
/// )
/// ```
class MoniTextField extends StatefulWidget {
  const MoniTextField({
    super.key,
    this.label,
    this.hint,
    this.supportingText,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.state = MoniTextFieldState.normal,
    this.size = MoniTextFieldSize.large,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.autofillHints,
  });

  final String? label;
  final String? hint;
  final String? supportingText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final MoniTextFieldState state;
  final MoniTextFieldSize size;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Iterable<String>? autofillHints;

  @override
  State<MoniTextField> createState() => _MoniTextFieldState();
}

class _MoniTextFieldState extends State<MoniTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;
  bool _obscured = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    _obscured = widget.obscureText;
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() => _hasFocus = _focusNode.hasFocus);
  }

  bool get _isDisabled => widget.state == MoniTextFieldState.disabled;
  bool get _isViewOnly => widget.state == MoniTextFieldState.viewOnly;

  // ---------------------------------------------------------------------------
  // Sizing helpers
  // ---------------------------------------------------------------------------

  double get _contentHeight => switch (widget.size) {
        MoniTextFieldSize.small => 40.0,
        MoniTextFieldSize.large => 48.0,
        MoniTextFieldSize.xl => 56.0,
      };

  EdgeInsets get _contentPadding {
    final v = (_contentHeight - 24) / 2;
    return EdgeInsets.symmetric(horizontal: 16, vertical: v.clamp(8.0, 20.0));
  }

  // ---------------------------------------------------------------------------
  // Color resolution
  // ---------------------------------------------------------------------------

  Color _borderColor(ColorScheme cs, SumeThemeExtension ext) {
    if (_isDisabled) return cs.onSurface.withValues(alpha: AppTokens.opacityDisabled);
    if (_isViewOnly) return ext.outlineSubtle;

    return switch (widget.state) {
      MoniTextFieldState.negative => cs.error,
      MoniTextFieldState.positive => cs.secondary,
      MoniTextFieldState.focused => cs.primary,
      _ => _hasFocus ? cs.primary : ext.outlineSubtle,
    };
  }

  Color _fillColor(ColorScheme cs, SumeThemeExtension ext) {
    if (_isDisabled) return cs.surfaceContainerHighest;
    if (_isViewOnly) return cs.surfaceContainerLow;
    return cs.surfaceContainerLowest;
  }

  Color _labelColor(ColorScheme cs, SumeThemeExtension ext) {
    if (_isDisabled) return cs.onSurface.withValues(alpha: AppTokens.opacityDisabled);
    if (_isViewOnly) return ext.textSubtitle;
    return switch (widget.state) {
      MoniTextFieldState.negative => cs.error,
      MoniTextFieldState.positive => cs.secondary,
      MoniTextFieldState.focused => cs.primary,
      _ => _hasFocus ? cs.primary : ext.textSubtitle,
    };
  }

  Color _supportingColor(ColorScheme cs, SumeThemeExtension ext) {
    return switch (widget.state) {
      MoniTextFieldState.negative => cs.error,
      MoniTextFieldState.positive => cs.secondary,
      _ => ext.textSubtitle,
    };
  }

  Widget? _buildSuffixIcon(ColorScheme cs, SumeThemeExtension ext) {
    if (widget.obscureText) {
      return GestureDetector(
        onTap: () => setState(() => _obscured = !_obscured),
        child: Icon(
          _obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: ext.textSubtitle,
          size: AppTokens.iconMd,
        ),
      );
    }
    if (widget.suffixIcon != null) return widget.suffixIcon;
    return switch (widget.state) {
      MoniTextFieldState.negative => Icon(
          Icons.error_outline,
          color: cs.error,
          size: AppTokens.iconMd,
        ),
      MoniTextFieldState.positive => Icon(
          Icons.check_circle_outline,
          color: cs.secondary,
          size: AppTokens.iconMd,
        ),
      _ => null,
    };
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<SumeThemeExtension>()!;

    final borderColor = _borderColor(cs, ext);
    final activeBorderWidth =
        (_hasFocus || widget.state == MoniTextFieldState.negative || widget.state == MoniTextFieldState.positive)
            ? AppTokens.strokeLg
            : AppTokens.strokeSm;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTokens.radiusSm),
      borderSide: BorderSide(color: borderColor, width: activeBorderWidth),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          enabled: !_isDisabled,
          readOnly: _isViewOnly,
          obscureText: _obscured,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          autofillHints: widget.autofillHints,
          style: AppTypography.textTheme.bodyMedium?.copyWith(
            color: _isDisabled
                ? cs.onSurface.withValues(alpha: AppTokens.opacityDisabled)
                : cs.onSurface,
          ),
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            labelStyle:
                AppTypography.textTheme.bodyMedium?.copyWith(color: _labelColor(cs, ext)),
            hintStyle: AppTypography.textTheme.bodyMedium?.copyWith(
              color: ext.textSubtitle,
            ),
            filled: true,
            fillColor: _fillColor(cs, ext),
            prefixIcon: widget.prefixIcon,
            suffixIcon: _buildSuffixIcon(cs, ext),
            contentPadding: _contentPadding,
            enabledBorder: border,
            focusedBorder: border,
            disabledBorder: border,
            errorBorder: border,
            focusedErrorBorder: border,
            counterText: '',
            isDense: true,
          ),
        ),
        if (widget.supportingText != null) ...[
          SizedBox(height: AppTokens.spaceXxs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              widget.supportingText!,
              style: AppTypography.textTheme.bodySmall?.copyWith(
                color: _supportingColor(cs, ext),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
