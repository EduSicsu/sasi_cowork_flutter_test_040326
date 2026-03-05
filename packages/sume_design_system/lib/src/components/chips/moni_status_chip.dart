import 'package:flutter/material.dart';
import '../../theme/app_tokens.dart';
import '../../theme/app_typography.dart';
import '../../theme/sume_primitives.dart';
import '../../theme/sume_theme_extension.dart';

// ---------------------------------------------------------------------------
// Enums
// ---------------------------------------------------------------------------

/// Semantic colour of a [MoniStatusChip].
///
/// Directly maps to the status colour tokens in [SumeThemeExtension]:
/// - [success] — green (secondary palette)
/// - [warning] — yellow / amber
/// - [error] — red (error palette)
/// - [info] — blue
/// - [neutral] — gray
/// - [primary] — indigo (primary palette)
enum MoniChipStatus {
  success,
  warning,
  error,
  info,
  neutral,
  primary,
}

/// Size variant of a [MoniStatusChip].
enum MoniChipSize {
  /// Small pill — used in dense lists / carousels.
  small,

  /// Standard — default chip size.
  medium,
}

// ---------------------------------------------------------------------------
// MoniStatusChip
// ---------------------------------------------------------------------------

/// Moni Design System status / tag chip.
///
/// Renders a coloured pill with a dot indicator and optional label.
/// Matches the Figma "Status chips" component from the Documentation page.
///
/// Usage:
/// ```dart
/// MoniStatusChip(label: 'Active', status: MoniChipStatus.success)
/// MoniStatusChip(label: 'Pending', status: MoniChipStatus.warning)
/// MoniStatusChip(label: 'Error', status: MoniChipStatus.error, showDot: false)
/// ```
class MoniStatusChip extends StatelessWidget {
  const MoniStatusChip({
    super.key,
    required this.label,
    this.status = MoniChipStatus.neutral,
    this.size = MoniChipSize.medium,
    this.showDot = true,
    this.leadingIcon,
    this.onTap,
  });

  final String label;
  final MoniChipStatus status;
  final MoniChipSize size;

  /// Whether to show the coloured dot before the label.
  final bool showDot;

  /// Optional override icon in place of the dot indicator.
  final IconData? leadingIcon;

  /// When non-null the chip becomes tappable.
  final VoidCallback? onTap;

  // ---------------------------------------------------------------------------
  // Sizing helpers
  // ---------------------------------------------------------------------------

  EdgeInsets get _padding => switch (size) {
        MoniChipSize.small =>
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        MoniChipSize.medium =>
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      };

  double get _dotSize => switch (size) {
        MoniChipSize.small => 6.0,
        MoniChipSize.medium => 8.0,
      };

  double get _iconSize => switch (size) {
        MoniChipSize.small => AppTokens.iconXs,
        MoniChipSize.medium => AppTokens.iconSm,
      };

  // ---------------------------------------------------------------------------
  // Color resolution
  // ---------------------------------------------------------------------------

  _ChipColors _resolveColors(
    ColorScheme cs,
    SumeThemeExtension ext,
  ) {
    return switch (status) {
      MoniChipStatus.success => _ChipColors(
          background: cs.secondaryContainer,
          foreground: cs.onSecondaryContainer,
          dot: ext.statusSuccess,
        ),
      MoniChipStatus.warning => _ChipColors(
          background: cs.tertiaryContainer,
          foreground: cs.onTertiaryContainer,
          dot: ext.statusWarning,
        ),
      MoniChipStatus.error => _ChipColors(
          background: cs.errorContainer,
          foreground: cs.onErrorContainer,
          dot: cs.error,
        ),
      MoniChipStatus.info => _ChipColors(
          background: SumePrimitives.blue100,
          foreground: SumePrimitives.blue800,
          dot: ext.statusInfo,
        ),
      MoniChipStatus.neutral => _ChipColors(
          background: cs.surfaceContainerHighest,
          foreground: cs.onSurface,
          dot: ext.statusNeutral,
        ),
      MoniChipStatus.primary => _ChipColors(
          background: cs.primaryContainer,
          foreground: cs.onPrimaryContainer,
          dot: cs.primary,
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

    final labelStyle = (size == MoniChipSize.small
            ? AppTypography.textTheme.labelSmall
            : AppTypography.textTheme.labelMedium)
        ?.copyWith(color: colors.foreground);

    Widget chip = Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(AppTokens.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: _iconSize, color: colors.dot),
            SizedBox(width: AppTokens.spaceXxs),
          ] else if (showDot) ...[
            Container(
              width: _dotSize,
              height: _dotSize,
              decoration: BoxDecoration(
                color: colors.dot,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: AppTokens.spaceXxs),
          ],
          Text(label, style: labelStyle),
        ],
      ),
    );

    if (onTap != null) {
      chip = GestureDetector(
        onTap: onTap,
        child: chip,
      );
    }

    return chip;
  }
}

// ---------------------------------------------------------------------------
// Private data class
// ---------------------------------------------------------------------------

class _ChipColors {
  const _ChipColors({
    required this.background,
    required this.foreground,
    required this.dot,
  });

  final Color background;
  final Color foreground;
  final Color dot;
}
