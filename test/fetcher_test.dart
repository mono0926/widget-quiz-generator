import 'package:test/test.dart';
import 'package:widget_quiz_generator/fetcher.dart';

void main() {
  test('CartItem test', () async {
    final widgets = await fetch();
    expect(widgets.length, 153);
  });
}
