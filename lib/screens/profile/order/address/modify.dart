import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/providers/accounts.dart';
import 'package:brandu/screens/profile/order/address/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/check-box.dart';
import 'package:brandu/widgets/base/input-box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressModifyPage extends StatefulWidget {
  final Address address;
  const AddressModifyPage(this.address, {Key? key}) : super(key: key);

  @override
  State<AddressModifyPage> createState() => _AddressModifyPageState();
}

class _AddressModifyPageState extends State<AddressModifyPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _recipient = '';
  String _phoneNumber = '';
  String _address = '';
  String _zipCode = '';
  String _roadAddress = '';
  String _detailAddress = '';
  bool _isMain = false;

  @override
  Widget build(BuildContext context) {
    _name = widget.address.name;
    _recipient = widget.address.recipient;
    _phoneNumber = widget.address.phone_number;
    _zipCode = widget.address.zip_code;
    _address = widget.address.address;
    _roadAddress = widget.address.road_name_address;
    _detailAddress = widget.address.detail_address;
    _isMain = widget.address.is_main;

    return Scaffold(
      appBar: CustomAppBar(
        isBack: true,
        appBar: AppBar(),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                int id = widget.address.id;
                if (_isMain) {
                  await AccountsClient().postSetMain(widget.address.id);
                }
                Address address = Address(
                  id: id,
                  name: _name,
                  recipient: _recipient,
                  address: _address,
                  road_name_address: _roadAddress,
                  detail_address: _detailAddress,
                  zip_code: _zipCode,
                  phone_number: _phoneNumber,
                  is_main: _isMain,
                );
                AccountsClient().patchAddress(widget.address.id, address);
                Get.off(() => const ProfileAddressPage());
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Sending Message"),
                ));
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
          child: Wrap(
            direction: Axis.vertical,
            spacing: 10,
            children: [
              InputBox(
                '주소명',
                (value) {
                  setState(() {
                    _name = value as String;
                  });
                },
                _name,
              ),
              InputBox(
                '받는분',
                (value) {
                  setState(() {
                    _recipient = value as String;
                  });
                },
                _recipient,
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
                '주소',
                (value) {
                  setState(() {
                    _roadAddress = value as String;
                  });
                },
                _roadAddress,
              ),
              InputBox(
                '상세주소',
                (value) {
                  setState(() {
                    _detailAddress = value as String;
                  });
                },
                _detailAddress,
              ),
              Row(
                children: [
                  circleCheckBox(
                    _isMain,
                    (value) {
                      setState(() {
                        _isMain = value;
                      });
                    },
                  ),
                  MediumText('대표 배송지로 선택', Colors.black),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
