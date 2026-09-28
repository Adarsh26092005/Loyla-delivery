import 'package:flutter_test/flutter_test.dart';
import 'package:loyla_delivery/main.dart';

void main() {
  testWidgets('App launches without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const LoylaDeliveryApp());
    // TODO: add real widget tests once splash/login/nav are stable.
  });
}
