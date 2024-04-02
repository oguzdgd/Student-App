import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ogrenci_app/main.dart' as app;

void main() {
  group("Integration testler", () {
    testWidgets('integration test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('2 öğrenci'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.favorite_border), findsNWidgets(2));
      expect(find.byIcon(Icons.favorite), findsNothing);

      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });
  });
}
