import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/entities_implementation/strathplus_entity_implementation.dart';


void main() {
  testWidgets(
    'Should display StrathPLus Entities Widget correctly',
    (WidgetTester tester) async {
      // Build our widget and trigger a frame
      await tester.pumpWidget(const MaterialApp(
        home: StrathPLusImplementation(),
      ));


      // Use finder to locate widgets in the widget tree
      expect(find.text('StrathPLus Entities'), findsOneWidget);
      expect(find.byType(IconButton), findsWidgets);


      // Interaction and expectation
      await tester.tap(find.byType(IconButton));
      await tester.pump();


      // Verification after interaction
      expect(find.text('Button tapped!'), findsOneWidget);
    },
  );
}
