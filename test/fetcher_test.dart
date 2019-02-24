import 'package:test/test.dart';
import 'package:widget_quiz_generator/fetcher.dart';

void main() {
  test('Widgets fetch test', () async {
    final widgets = await fetch();
    expect(widgets.length, 153);
  });
}
