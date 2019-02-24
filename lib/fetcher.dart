import 'dart:convert';

import 'package:http/http.dart';
import 'package:widget_quiz_generator/keys.dart';
import 'package:widget_quiz_generator/widget.dart';

Future<List<Widget>> fetch() async {
  final res = await Client().get(
    'https://api.github.com/repos/flutter/website/contents/src/_data/catalog/widgets.json',
    headers: {'Authorization': 'token $githubToken'},
  );
  final content = (jsonDecode(String.fromCharCodes(base64Decode(
          (jsonDecode(res.body)['content'] as String)
              .replaceAll('\n', '')))) as List)
      .map((j) => Widget.fromJson(j as Map<String, dynamic>))
      .toList();
  return content;
}
