import 'package:flutter/material.dart';
import 'package:sume_design_system/sume_design_system.dart';
import 'app/config/dependencies/service_locator.dart';
import 'app/config/routes/routes_generator.dart';
import 'app/features/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SASI Cowork',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routes: RoutesGenerator.getRoutes(),
      initialRoute: LoginPage.routeName,
    );
  }
}
