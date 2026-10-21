import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:davipontoturistico/main.dart';

void main() {
  testWidgets('exibe o catálogo e atualiza as marcações', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const Principal());

    expect(find.text('Leonardo Moya'), findsOneWidget);
    expect(find.text('Orla da Praia do Gonzaga'), findsOneWidget);
    expect(find.byType(Checkbox), findsWidgets);

    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();

    final Checkbox checkbox = tester.widget(find.byType(Checkbox).first);
    expect(checkbox.value, isTrue);
  });
}
