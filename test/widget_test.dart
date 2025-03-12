import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_study/main.dart';

void main() {
  testWidgets('Teste de usabilidade da página "Consumo de API (Poke API)"',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Abrir o Drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Navegar até a aba "Consumo de API"
    await tester.tap(find.text('Consumo de API (Poke API)'));
    await tester.pumpAndSettle();

    // Verifica se a lista carregou os pokemons
    expect(find.text('bulbasaur'), findsOneWidget);
    expect(find.text('squirtle'), findsOneWidget);

    // Fazer o scroll
    await tester.drag(find.byType(Scrollable), const Offset(0, -600));
    await tester.pumpAndSettle();

    // Verifica se o item existe após o scroll
    expect(find.text('wartortle'), findsOneWidget);

    // Fazer o scroll
    await tester.drag(find.byType(Scrollable), const Offset(0, -600));
    await tester.pumpAndSettle();

    // Verifica se o item existe após o scroll
    expect(find.text('kakuna'), findsOneWidget);
  });
}
