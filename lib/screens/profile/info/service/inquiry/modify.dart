import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/service.dart';
import 'package:brandu/providers/services.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/button-box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryModifyPage extends StatefulWidget {
  final Inquiry inquiry;
  const InquiryModifyPage(this.inquiry, {Key? key}) : super(key: key);

  @override
  State<InquiryModifyPage> createState() => _InquiryModifyPageState();
}

class _InquiryModifyPageState extends State<InquiryModifyPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    _title = widget.inquiry.title;
    _description = widget.inquiry.description;

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '1:1 문의하기',
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                try {
                  Inquiry inquiry = await ServiceClient()
                      .patchInquiry(widget.inquiry.id, _title, _description);
                } catch (exception) {
                  print(exception);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Sending Message"),
                  ));
                }
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              alignment: Alignment.center,
              child: MediumBoldText.withoutColor('저장'),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MediumText('문의 제목', Colors.black),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  style: const TextStyle(
                    fontFamily: 'Noto Sans KR',
                    fontSize: 14,
                    height: 1.4,
                    letterSpacing: -0.5,
                    wordSpacing: -0.5,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                  decoration: const InputDecoration(
                    hintText: '문의 제목을 작성해주세요',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(width: 1, color: lightGreyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(width: 1, color: lightGreyColor),
                    ),
                  ),
                  initialValue: _title,
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    _title = value as String;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MediumText('문의 내용', Colors.black),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 175,
                child: TextFormField(
                  style: const TextStyle(
                    fontFamily: 'Noto Sans KR',
                    fontSize: 14,
                    height: 1.4,
                    letterSpacing: -0.5,
                    wordSpacing: -0.5,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: '문의 내용을 작성해주세요',
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(width: 1, color: lightGreyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(width: 1, color: lightGreyColor),
                    ),
                  ),
                  initialValue: _description,
                  keyboardType: TextInputType.multiline,
                  onSaved: (value) {
                    _description = value as String;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 20,
                ),
                child: ButtonBox('삭제하기', () async {
                  bool isDeleted =
                      await ServiceClient().deleteInquiry(widget.inquiry.id);
                  if (isDeleted) {
                    Get.back();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
