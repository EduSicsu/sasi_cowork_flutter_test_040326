import 'package:flutter/material.dart';
import '../../theme/app_tokens.dart';
import '../../theme/app_typography.dart';
import '../../theme/sume_theme_extension.dart';

// ---------------------------------------------------------------------------
// Enums
// ---------------------------------------------------------------------------

/// Visual style of a [MoniButton].
///
/// Matches the Figma component property `Kind`:
/// - [filled] — solid primary background (default action)
/// - [tonal] — light primary-tinted container
/// - [filledDanger] — solid error background (destructive action)
/// - [tonalDanger] — light error-tinted container
/// - [text] — transparent, neutral foreground
/// - [textPrimary] — transparent, bright CTA foreground
/// - [textDanger] — transparent, error foreground
enum MoniButtonVariant {
  filled,
  tonal,
  filledDanger,
  tonalDanger,
  text,
  textPrimary,
  textDanger,
}

/// Size of a [MoniButton].
///
/// Matches the Figma component property `Size`:
/// - [large] — 56 px height, 24 px horizontal padding
/// - [normal] — 40 px height, 16 px horizontal padding (default)
/// - [small] — 35 px height, 8 px horizontal padding
enum MoniButtonSize { large, normal, small }

// ---------------------------------------------------------------------------
// MoniButton
// ---------------------------------------------------------------------------

/// Moni Design System button.
///
/// Covers all 7 Figma variants and 3 sizes with optional leading/trailing icons.
///
/// Usage:
/// ```dart
/// MoniButton(
///   label: 'Confirm',
///   onPressed: () {},
/// )
/// MoniButton.danger(
///   label: 'Delete',
///   onPressed: () {},
///   leadingIcon: Icons.delete_outline,
/// )
/// ```
class MoniButton extends StatelessWidget {
  const MoniButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = MoniButtonVariant.filled,
    this.size = MoniButtonSize.normal,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  const MoniButton.filled({
    super.key,
    required this.label,
    this.onPressed,
    this.size = MoniButtonSize.normal,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : variant = MoniButtonVariant.filled;

  const MoniButton.tonal({
    super.key,
    required this.label,
    this.onPressed,
    this.size = MoniButtonSize.normal,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : variant = MoniButtonVariant.tonal;

  const MoniButton.danger({
    super.key,
    required this.label,
    this.onPressed,
    this.size = MoniButtonSize.normal,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : variant = MoniButtonVariant.filledDanger;

  const MoniButton.tonalDanger({
    super.key,
    required this.label,
    this.onPressed,
    this.size = MoniButtonSize.normal,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : variant = MoniButtonVariant.tonalDanger;

  const MoniButton.text({
    super.key,
    required this.label,
    this.onPressed,
    this.size = MoniButtonSize.normal,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : variant = MoniButtonVariant.text;

  const MoniButton.textPrimary({
    super.key,
    required this.label,
    this.onPressed,
    this.size = MoniButtonSize.normal,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : variant = MoniButtonVariant.textPrimary;

  const MoniButton.textDanger({
    super.key,
    required this.label,
    this.onPressed,
    this.size = MoniButtonSize.normal,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : variant = MoniButtonVariant.textDanger;

  final String label;
  final VoidCallback? onPressed;
  final MoniButtonVariant variant;
  final MoniButtonSize size;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool isLoading;
  final bool isFullWidth;

  // ---------------------------------------------------------------------------
  // Sizing helpers
  // ---------------------------------------------------------------------------

  double get _height => switch (size) {
        MoniButtonSize.large => 56.0,
        MoniButtonSize.normal => 40.0,
        MoniButtonSize.small => 35.0,
      };

  EdgeInsets get _padding => switch (size) {
        MoniButtonSize.large =>
          const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        MoniButtonSize.normal =>
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        MoniButtonSize.small =>
          const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      };

  double get _iconSize => switch (size) {
        MoniButtonSize.large => AppTokens.iconLg,
        MoniButtonSize.normal => AppTokens.iconMd,
        MoniButtonSize.small => AppTokens.iconSm,
      };

  TextStyle? get _textStyle => switch (size) {
        MoniButtonSize.large => AppTypography.textTheme.labelLarge,
        MoniButtonSize.normal => AppTypography.textTheme.labelMedium,
        MoniButtonSize.small => AppTypography.textTheme.labelSmall,
      };

  // ---------------------------------------------------------------------------
  // Color helpers
  // ---------------------------------------------------------------------------

  _ButtonColors _resolveColors(
    ColorScheme cs,
    SumeThemeExtension ext,
  ) {
    return switch (variant) {
      MoniButtonVariant.filled => _ButtonColors(
          background: cs.primary,
          foreground: cs.onPrimary,
          pressedBackground: cs.primary.withValues(alpha: 0.85),
        ),
      MoniButtonVariant.tonal => _ButtonColors(
          background: cs.primaryContainer,
          foreground: cs.primary,
          pressedBackground: cs.primaryContainer.withValues(alpha: 0.75),
        ),
      MoniButtonVariant.filledDanger => _ButtonColors(
          background: ext.bgError,
          foreground: cs.onError,
          pressedBackground: ext.bgError.withValues(alpha: 0.85),
        ),
      MoniButtonVariant.tonalDanger => _ButtonColors(
          background: ext.bgErrorTonalContainer,
          foreground: cs.error,
          pressedBackground: cs.errorContainer,
        ),
      MoniButtonVariant.text => _ButtonColors(
          background: Colors.transparent,
          foreground: cs.onSurface,
          pressedBackground: cs.onSurface.withValues(alpha: AppTokens.opacityPressed),
        ),
      MoniButtonVariant.textPrimary => _ButtonColors(
          background: Colors.transparent,
          foreground: ext.textPrimary,
          pressedBackground:
              ext.textPrimary.withValues(alpha: AppTokens.opacityPressed),
        ),
      MoniButtonVariant.textDanger => _ButtonColors(
          background: Colors.transparent,
          foreground: cs.error,
          pressedBackground: cs.error.withValues(alpha: AppTokens.opacityPressed),
        ),
    };
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<SumeThemeExtension>()!;
    final colors = _resolveColors(cs, ext);
    final disabled = onPressed == null && !isLoading;

    final style = ButtonStyle(
      minimumSize: WidgetStateProperty.all(
        Size(isFullWidth ? double.infinity : 0, _height),
      ),
      maximumSize: isFullWidth
          ? WidgetStateProperty.all(const Size(double.infinity, double.infinity))
          : null,
      padding: WidgetStateProperty.all(_padding),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusSm),
        ),
      ),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (disabled) {
          return cs.onSurface.withValues(alpha: AppTokens.opacityDisabled);
        }
        if (states.contains(WidgetState.pressed)) {
          return colors.pressedBackground;
        }
        return colors.background;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (disabled) {
          return cs.onSurface.withValues(alpha: AppTokens.opacityDisabled);
        }
        return colors.foreground;
      }),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      elevation: WidgetStateProperty.all(AppTokens.elevationNone),
      textStyle: WidgetStateProperty.all(_textStyle),
    );

    Widget content;
    if (isLoading) {
      content = SizedBox(
        width: _iconSize,
        height: _iconSize,
        child: CircularProgressIndicator(
          strokeWidth: AppTokens.strokeMd,
          color: disabled
              ? cs.onSurface.withValues(alpha: AppTokens.opacityDisabled)
              : colors.foreground,
        ),
      );
    } else {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: _iconSize),
            SizedBox(width: AppTokens.spaceXs),
          ],
          Text(label),
          if (trailingIcon != null) ...[
            SizedBox(width: AppTokens.spaceXs),
            Icon(trailingIcon, size: _iconSize),
          ],
        ],
      );
    }

    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: content,
    );
  }
}

// ---------------------------------------------------------------------------
// Private data class
// ---------------------------------------------------------------------------

class _ButtonColors {
  const _ButtonColors({
    required this.background,
    required this.foreground,
    required this.pressedBackground,
  });

  final Color background;
  final Color foreground;
  final Color pressedBackground;
}
