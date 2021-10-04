import 'package:flutter/widgets.dart';
import 'package:flutter_integration_test/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("ボタンを押したときの挙動", (WidgetTester tester) async {
    // アプリを立ち上げる
    app.main();
    await tester.pumpAndSettle(); // 描画が終わるのを待つ

    // 初期値は'0'であることを確認
    expect(find.text('0'), findsOneWidget);

    // 1回ボタンタップしたら'1'であることを確認
    await tester.tap(find.byKey(const Key('button')));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    // その後20回タップしたら'21'になっていることを確認
    for (var i = 0; i < 20; i++) {
      await tester.tap(find.byKey(const Key('button')));
      await tester.pumpAndSettle();
    }
    expect(find.text('21'), findsOneWidget);
  });
}
