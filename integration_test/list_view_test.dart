import 'package:flutter/widgets.dart';
import 'package:flutter_integration_test/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("ボタンで追加して、スクロール可能なことを確認", (WidgetTester tester) async {
    // アプリを立ち上げる
    app.main();
    await tester.pumpAndSettle(); // 描画が終わるのを待つ

    // リストビューページへ繊維
    await tester.tap(find.byKey(const Key('listViewPageButton')));
    await tester.pumpAndSettle();

    // 100回タップてスクロールしてみる
    for (var i = 0; i < 100; i++) {
      await tester.tap(find.byKey(const Key('floatingActionButton')));
    }
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('100'),
      50,
      maxScrolls: 1000,
    ); // 100という文字が見えるまで、スクロールする
    expect(find.text('100'), findsOneWidget);
  });
}
