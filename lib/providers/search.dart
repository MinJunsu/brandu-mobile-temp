import 'dart:convert';

import 'package:brandu/models/search.dart';
import 'package:brandu/providers/main.dart';
import 'package:http/http.dart';

class SearchClient extends APIClient {
  Future<List<RecentSearch>> getRecentSearches() async {
    Response response = await getRequest('/api/v1/search/history/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => RecentSearch.fromJson(model)));
    }
    throw Error();
  }

  Future<List<SearchRank>> getSearchRanks() async {
    Response response = await getRequest('/api/v1/search/rank/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => SearchRank.fromJson(model)));
    }
    throw Error();
  }
}
