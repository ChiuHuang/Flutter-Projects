import 'package:flutter_test/flutter_test.dart';
import 'package:MyProjectsFlutter/main.dart'; // Update this with your app's import path

void main() {
  testWidgets('App builds and shows title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyProjectsFlutter());

    // Wait for the widget tree to settle.
    await tester.pumpAndSettle();

    // Verify that the app displays a title or some key widget.
    expect(find.text("Codefoxy's Projects"), findsOneWidget);
    // You can add more checks based on your app's UI
  });
}
