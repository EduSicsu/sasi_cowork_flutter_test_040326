import 'package:flutter/material.dart';
import '../../features/home/home_page.dart';
import '../../features/login/login_page.dart';
import '../../features/mfa_verification/mfa_verification_page.dart';

class RoutesGenerator {
  static Map<String, WidgetBuilder> getRoutes() => {
        LoginPage.routeName: (context) => LoginPage.pageBuilder(
              context,
              arguments: ModalRoute.of(context)?.settings.arguments,
            ),
        MfaVerificationPage.routeName: (context) => MfaVerificationPage.pageBuilder(
              context,
              arguments: ModalRoute.of(context)?.settings.arguments,
            ),
        HomePage.routeName: (context) => HomePage.pageBuilder(
              context,
              arguments: ModalRoute.of(context)?.settings.arguments,
            ),
      };
}
