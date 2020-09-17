import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MainApp());
  });
}
