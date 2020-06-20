import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_random_background_color/main.dart';

void main() {
  testWidgets('finds a Text widget', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that there is text "Hey there" on screen
    expect(find.text('Hey there'), findsOneWidget);
    expect(find.text('Some text'), findsNothing);
  });

  testWidgets('check default background color', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final background =
        tester.firstWidget(find.byType(AnimatedContainer)) as AnimatedContainer;

    // Verify that default background color is white
    expect((background.decoration as BoxDecoration).color, Colors.white);
  });

  testWidgets('check changing background color', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final prevBackground =
        tester.firstWidget(find.byType(AnimatedContainer)) as AnimatedContainer;

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    final newBackground =
        tester.firstWidget(find.byType(AnimatedContainer)) as AnimatedContainer;

    // Verify that background color has changed.
    expect(
        (prevBackground.decoration as BoxDecoration).color !=
            (newBackground.decoration as BoxDecoration).color,
        true);
  });
}
