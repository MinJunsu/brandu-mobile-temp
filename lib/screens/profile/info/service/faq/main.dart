import 'package:brandu/components/text.dart';
import 'package:brandu/models/service.dart';
import 'package:brandu/providers/services.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  final int? id;
  const FAQPage({this.id, Key? key}) : super(key: key);

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  late Future<PaginatedFAQ> faqs;
  List<FAQWithExpanded> faqWithExpands = [];

  @override
  void initState() {
    super.initState();
    faqs = ServiceClient().getFAQs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '자주 묻는 질문',
        actions: const <Widget>[],
      ),
      body: FutureBuilder<PaginatedFAQ>(
        future: faqs,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            if (faqWithExpands.isEmpty) {
              faqWithExpands = List.generate(
                snapshot.requireData.results.length,
                (index) => FAQWithExpanded(
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
                      children: faqWithExpands
                          .map(
                            (faq) => ExpansionPanel(
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
                                              faq.faq.title, Colors.black)
                                          : SmallText(
                                              faq.faq.title, Colors.black),
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
                                  faq.faq.description,
                                  Colors.black,
                                ),
                              ),
                              isExpanded: faq.expanded,
                              canTapOnHeader: true,
                            ),
                          )
                          .toList(),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          faqWithExpands[index].expanded = !isExpanded;
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

class FAQWithExpanded {
  final FAQ faq;
  bool expanded;

  FAQWithExpanded(this.faq, this.expanded);
}
