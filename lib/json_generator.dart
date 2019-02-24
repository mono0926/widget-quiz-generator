import 'dart:io';

import 'package:widget_quiz_generator/fetcher.dart';
import 'package:widget_quiz_generator/youtube.dart';

import 'dart:convert';

generateJSON() async {
  final widgets = await fetch();
  final wowItems = await fetchWidgetsOfTheWeekItems();

  for (final w in widgets) {
    final item = wowItems.firstWhere(
        (item) => item.snippet.title.startsWith(w.name),
        orElse: () => null);
    if (item != null) {
      w.wowLink =
          'https://www.youtube.com/watch?v=${item.contentDetails.videoId}';
    }
  }
  // print(widgets);

  File('./w.json').writeAsStringSync(jsonEncode(widgets));
}
