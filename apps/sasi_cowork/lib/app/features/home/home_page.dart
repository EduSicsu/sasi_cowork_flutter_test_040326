import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  static Widget build(BuildContext context, {Object? arguments}) {
    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
