import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/providers/accounts.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/base/input-box.dart';
import 'package:brandu/widgets/header-icon.dart';
import 'package:brandu/widgets/profile/modify-button.dart';
import 'package:flutter/material.dart';

class ProfileMyPage extends StatefulWidget {
  const ProfileMyPage({Key? key}) : super(key: key);

  @override
  State<ProfileMyPage> createState() => _ProfileMyPageState();
}

class _ProfileMyPageState extends State<ProfileMyPage> {
  late Future<Profile> profile;
  final _formKey = GlobalKey<FormState>();
  String _nickname = '';
  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _sns = '';
  String _description = '';

  @override
  void initState() {
    super.initState();
    profile = AccountsClient().getProfile();
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
        title: '개인정보 수정',
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // 서버에 요청
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
      body: FutureBuilder<Profile>(
        future: profile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _nickname = snapshot.requireData.nickname ?? '';
            _name = snapshot.requireData.name ?? '';
            _phoneNumber = snapshot.requireData.phone_number ?? '';
            _email = snapshot.requireData.email ?? '';
            _sns = snapshot.requireData.social_link ?? '';
            _description = snapshot.requireData.description ?? '';
            return Container(
              height: double.infinity,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: lightGreyColor,
                    ),
                    child: ModifyButton(() {}),
                  ),
                  Positioned(
                    top: 150,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ModifyButton(() {}),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20,
                      ),
                      child: SizedBox(
                        height: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MediumText('회원정보', Colors.black),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Form(
                                  key: _formKey,
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    spacing: 10,
                                    children: [
                                      InputBox(
                                        '닉네임',
                                        (value) {
                                          setState(() {
                                            _nickname = value as String;
                                          });
                                        },
                                        _nickname,
                                      ),
                                      InputBox(
                                        '이름',
                                        (value) {
                                          setState(() {
                                            _name = value as String;
                                          });
                                        },
                                        _name,
                                      ),
                                      InputBox(
                                        '연락처',
                                        (value) {
                                          setState(() {
                                            _phoneNumber = value as String;
                                          });
                                        },
                                        _phoneNumber,
                                      ),
                                      InputBox(
                                        '이메일',
                                        (value) {
                                          setState(() {
                                            _email = value as String;
                                          });
                                        },
                                        _email,
                                      ),
                                      InputBox(
                                        'SNS',
                                        (value) {
                                          setState(() {
                                            _sns = value as String;
                                          });
                                        },
                                        _sns,
                                      ),
                                      InputBox(
                                        '소개',
                                        (value) {
                                          setState(() {
                                            _description = value as String;
                                          });
                                        },
                                        _description,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return indicator();
        },
      ),
    );
  }
}
