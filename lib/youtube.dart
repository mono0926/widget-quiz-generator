import 'dart:io';
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/youtube/v3.dart';

Future<List<PlaylistItem>> fetchWidgetsOfTheWeekItems() async {
  final credentials = ServiceAccountCredentials.fromJson(
      new File('assets/service_account.json').readAsStringSync());

  final client = await clientViaServiceAccount(
      credentials, [YoutubeApi.YoutubeReadonlyScope]);

  final api = YoutubeApi(client);

  final items = List<PlaylistItem>();
  String pageToken = null;
  while (true) {
    final result = await api.playlistItems.list(
        'id,snippet,contentDetails,status',
        pageToken: pageToken,
        maxResults: 50,
        playlistId: 'PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG');
    items.addAll(result.items);
    if (result.items.length < 50) {
      break;
    } else {
      pageToken = result.nextPageToken;
    }
  }

  print(items.length);
  return items;
}
