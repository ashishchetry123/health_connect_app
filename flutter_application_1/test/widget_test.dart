import 'package:flutter_test/flutter_test.dart';
import 'package:health_connect_app/main.dart';
import 'package:health_connect_app/providers/health_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Health Connect app fetches and displays health data', (WidgetTester tester) async {
    // Wrap the app with a provider for testing.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HealthProvider()),
        ],
        child: MyApp(),
      ),
    );

    // Verify the initial state of the app.
    expect(find.text('Fetch Health Data'), findsOneWidget);
    expect(find.text('Steps'), findsNothing);
    expect(find.text('Calories'), findsNothing);
    expect(find.text('Heart Rate'), findsNothing);

    // Simulate tapping the 'Fetch Health Data' button.
    await tester.tap(find.text('Fetch Health Data'));
    await tester.pumpAndSettle(); // Wait for the async operation to complete.

    // Verify that the health data is displayed.
    expect(find.text('Steps'), findsOneWidget);
    expect(find.text('Calories'), findsOneWidget);
    expect(find.text('Heart Rate'), findsOneWidget);
  });
}
