import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/search.dart';
import 'package:brandu/providers/search.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/base/tag-box.dart';
import 'package:brandu/widgets/header.dart';
import 'package:brandu/widgets/search/search-box.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  late Future<List<RecentSearch>> recentSearches;
  late Future<List<SearchRank>> searchRanks;
  String keyword = '';

  @override
  void initState() {
    super.initState();
    controller.addListener(setSearchWord);
    recentSearches = SearchClient().getRecentSearches();
    searchRanks = SearchClient().getSearchRanks();
  }

  void setSearchWord() {
    setState(() {
      keyword = controller.text;
    });
  }

  void onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createHeader(
        isSearch: false,
        title: '검색',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchBox(controller),
          getBorder(),
          FutureBuilder<List<RecentSearch>>(
            future: recentSearches,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumBoldText('최근 검색어', Colors.black),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 5,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 10,
                            children: snapshot.requireData
                                .map((recentSearch) => TagBox(
                                      id: recentSearch.id,
                                      title: recentSearch.search_word,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediumBoldText('최근 검색어', Colors.black),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 5,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,
                          children: const <Widget>[],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          FutureBuilder<List<SearchRank>>(
            future: searchRanks,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 10,
                      ),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.requireData.length,
                        itemBuilder: (context, index) {
                          SearchRank searchRank = snapshot.requireData[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    MediumBoldText(
                                        (index + 1).toString(), mainColor),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    MediumText(
                                        searchRank.search_word, Colors.black),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 1,
                                  color: lightGreyColor,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
              return SizedBox(
                height: 500,
                child: indicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
