// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_solid_test/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('2 text widgets exist', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there are 2 widgets with text 'Hey there'
    expect(find.text('Hey there'), findsNWidgets(2));
    expect(find.text('Hey There'), findsNothing);

  });
}
