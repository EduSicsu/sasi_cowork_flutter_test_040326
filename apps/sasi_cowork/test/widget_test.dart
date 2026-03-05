import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sasi_cowork/main.dart';

void main() {
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
