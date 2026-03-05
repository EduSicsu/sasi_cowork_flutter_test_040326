import 'package:flutter/material.dart';

/// Raw Sumé Design System color palette.
///
/// These are the primitive tokens extracted directly from the Figma file
/// "❖ Monitoring Mobile v2 (Sumé DS applied)" — Global Colors collection.
/// Do not use these directly in UI; prefer the semantic tokens in [AppColors].
abstract final class SumePrimitives {
  // ---------------------------------------------------------------------------
  // Indigo — Primary brand color
  // ---------------------------------------------------------------------------
  static const Color indigo10 = Color(0xFFF4F5FF);
  static const Color indigo50 = Color(0xFFE4E7F8);
  static const Color indigo100 = Color(0xFFC3C9E8);
  static const Color indigo200 = Color(0xFFA7AFDD);
  static const Color indigo300 = Color(0xFF9AA6DF);
  static const Color indigo400 = Color(0xFF6877C9);
  static const Color indigo500 = Color(0xFF3F51B5);
  static const Color indigo600 = Color(0xFF394AA5);
  static const Color indigo700 = Color(0xFF2D3A81);
  static const Color indigo800 = Color(0xFF232D64);
  static const Color indigo900 = Color(0xFF111633);
  static const Color indigo1000 = Color(0xFF0B0F21);

  // ---------------------------------------------------------------------------
  // Gray — Neutral scale
  // ---------------------------------------------------------------------------
  static const Color gray10 = Color(0xFFFCFCFC);
  static const Color gray50 = Color(0xFFF0F1F4);
  static const Color gray100 = Color(0xFFE1E4E9);
  static const Color gray300 = Color(0xFFA7AEBD);
  static const Color gray500 = Color(0xFF6C7992);
  static const Color gray600 = Color(0xFF566075);
  static const Color gray700 = Color(0xFF414857);
  static const Color gray800 = Color(0xFF2B303A);
  static const Color gray900 = Color(0xFF1E2229);
  static const Color gray1000 = Color(0xFF0A0B0B);

  // ---------------------------------------------------------------------------
  // Green — Success / Secondary
  // ---------------------------------------------------------------------------
  static const Color green10 = Color(0xFFE7FDF8);
  static const Color green100 = Color(0xFFB4EBDE);
  static const Color green200 = Color(0xFF8FE2CE);
  static const Color green500 = Color(0xFF0CBF94);
  static const Color green700 = Color(0xFF09886A);
  static const Color green900 = Color(0xFF033327);
  static const Color green1000 = Color(0xFF022119);

  // ---------------------------------------------------------------------------
  // Red — Error / Danger
  // ---------------------------------------------------------------------------
  static const Color red10 = Color(0xFFFEFAFA);
  static const Color red100 = Color(0xFFFAD5D0);
  static const Color red300 = Color(0xFFF18273);
  static const Color red500 = Color(0xFFE82F16);
  static const Color red600 = Color(0xFFBA2611);
  static const Color red800 = Color(0xFF5D1308);
  static const Color red1000 = Color(0xFF210702);

  // ---------------------------------------------------------------------------
  // Yellow — Warning / Tertiary
  // ---------------------------------------------------------------------------
  static const Color yellow10 = Color(0xFFFFFDF9);
  static const Color yellow50 = Color(0xFFFFF7E5);
  static const Color yellow100 = Color(0xFFFFF0CB);
  static const Color yellow200 = Color(0xFFFEE299);
  static const Color yellow300 = Color(0xFFFED466);
  static const Color yellow600 = Color(0xFFCB9200);
  static const Color yellow800 = Color(0xFF654900);
  static const Color yellow900 = Color(0xFF322400);
  static const Color yellow1000 = Color(0xFF211700);

  // ---------------------------------------------------------------------------
  // Blue — Informational
  // ---------------------------------------------------------------------------
  static const Color blue10 = Color(0xFFECF6FF);
  static const Color blue50 = Color(0xFFE9F3FB);
  static const Color blue100 = Color(0xFFD3E6F7);
  static const Color blue300 = Color(0xFF7CB4E8);
  static const Color blue600 = Color(0xFF0F68BC);
  static const Color blue800 = Color(0xFF08345E);
  static const Color blue1000 = Color(0xFF021221);

  // ---------------------------------------------------------------------------
  // Primary (bright blue) — CTA / action color
  // ---------------------------------------------------------------------------
  static const Color primary400 = Color(0xFF337BFF);
  static const Color primary500 = Color(0xFF005BFF);
  static const Color primary700 = Color(0xFF003699);

  // ---------------------------------------------------------------------------
  // Teal — Alternate accent
  // ---------------------------------------------------------------------------
  static const Color teal10 = Color(0xFFEFFFFC);
  static const Color teal50 = Color(0xFFE6F5F3);
  static const Color teal100 = Color(0xFFB0DEDA);
  static const Color teal300 = Color(0xFF54B9AF);
  static const Color teal600 = Color(0xFF00897C);
  static const Color teal800 = Color(0xFF00534B);
  static const Color teal1000 = Color(0xFF00332E);

  // ---------------------------------------------------------------------------
  // Purple
  // ---------------------------------------------------------------------------
  static const Color purple400 = Color(0xFFB052C0);

  // ---------------------------------------------------------------------------
  // Pure
  // ---------------------------------------------------------------------------
  static const Color pureBlack = Color(0xFF090B0D);
  static const Color pureWhite = Color(0xFFFCFCFC);
}
