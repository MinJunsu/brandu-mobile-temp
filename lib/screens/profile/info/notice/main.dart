import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/service.dart';
import 'package:brandu/providers/services.dart';
import 'package:brandu/utilities/formater.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/header-icon.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  late Future<List<Notice>> notices;
  List<NoticeWithExpanded> noticeWithExpands = [];

  @override
  void initState() {
    super.initState();
    notices = ServiceClient().getNotices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        leading: Row(
          children: [
            backIcon(),
            homeIcon(),
          ],
        ),
        title: '공지 사항',
        actions: const <Widget>[],
      ),
      body: FutureBuilder<List<Notice>>(
        future: notices,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            if (noticeWithExpands.isEmpty) {
              noticeWithExpands = List.generate(
                snapshot.requireData.length,
                (index) => NoticeWithExpanded(
                  snapshot.requireData[index],
                  false,
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpansionPanelList(
                      children: noticeWithExpands
                          .map(
                            (notice) => ExpansionPanel(
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
                                              notice.notice.title, Colors.black)
                                          : SmallText(notice.notice.title,
                                              Colors.black),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SmallText(
                                        baseDateFormat
                                            .format(notice.notice.created),
                                        greyColor,
                                      ),
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
                                  notice.notice.description,
                                  Colors.black,
                                ),
                              ),
                              isExpanded: notice.expanded,
                              canTapOnHeader: true,
                            ),
                          )
                          .toList(),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          noticeWithExpands[index].expanded = !isExpanded;
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

class NoticeWithExpanded {
  final Notice notice;
  bool expanded;

  NoticeWithExpanded(this.notice, this.expanded);
}
