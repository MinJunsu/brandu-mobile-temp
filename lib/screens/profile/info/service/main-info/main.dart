import 'package:brandu/components/text.dart';
import 'package:brandu/models/service.dart';
import 'package:brandu/providers/services.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:flutter/material.dart';

class MainInfoPage extends StatefulWidget {
  const MainInfoPage({Key? key}) : super(key: key);

  @override
  State<MainInfoPage> createState() => _MainInfoPageState();
}

class _MainInfoPageState extends State<MainInfoPage> {
  late Future<PaginatedMainInfo> mainInfos;
  List<MainInfoWithExpanded> mainInfoWithExpands = [];

  @override
  void initState() {
    super.initState();
    mainInfos = ServiceClient().getMainInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '서비스 주요안내',
        actions: const <Widget>[],
      ),
      body: FutureBuilder<PaginatedMainInfo>(
        future: mainInfos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (mainInfoWithExpands.isEmpty) {
              mainInfoWithExpands = List.generate(
                snapshot.requireData.results.length,
                (index) => MainInfoWithExpanded(
                  snapshot.requireData.results[index],
                  false,
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpansionPanelList(
                      children: mainInfoWithExpands
                          .map(
                            (mainInfo) => ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      isExpanded
                                          ? SmallBoldText(
                                              mainInfo.mainInfo.title,
                                              Colors.black)
                                          : SmallText(mainInfo.mainInfo.title,
                                              Colors.black),
                                    ],
                                  ),
                                );
                              },
                              body: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 20,
                                ),
                                child: SmallText(
                                  mainInfo.mainInfo.description,
                                  Colors.black,
                                ),
                              ),
                              isExpanded: mainInfo.expanded,
                              canTapOnHeader: true,
                            ),
                          )
                          .toList(),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          mainInfoWithExpands[index].expanded = !isExpanded;
                        });
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return indicator();
        },
      ),
    );
  }
}

class MainInfoWithExpanded {
  final MainInfo mainInfo;
  bool expanded;

  MainInfoWithExpanded(this.mainInfo, this.expanded);
}
