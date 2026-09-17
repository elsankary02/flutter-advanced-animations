// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:animation/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Animated container changes size', (WidgetTester tester) async {
    await tester.pumpWidget(const FlutterAdvancedAnimations());

    expect(find.text('Animated Foo Baasics'), findsOneWidget);
    expect(find.text('Click Here To Change'), findsOneWidget);

    final initialSize = tester.getSize(find.byType(AnimatedContainer));
    await tester.tap(find.text('Click Here To Change'));
    await tester.pumpAndSettle();

    final expandedSize = tester.getSize(find.byType(AnimatedContainer));
    expect(expandedSize.width, greaterThan(initialSize.width));
    expect(expandedSize.height, greaterThan(initialSize.height));
  });
}
