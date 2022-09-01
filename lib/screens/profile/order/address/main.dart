import 'package:brandu/models/account.dart';
import 'package:brandu/providers/accounts.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/header-icon.dart';
import 'package:brandu/widgets/profile/address-box.dart';
import 'package:flutter/material.dart';

class ProfileAddressPage extends StatefulWidget {
  const ProfileAddressPage({Key? key}) : super(key: key);

  @override
  State<ProfileAddressPage> createState() => _ProfileAddressPageState();
}

class _ProfileAddressPageState extends State<ProfileAddressPage> {
  late Future<List<Address>> addresses;

  @override
  void initState() {
    super.initState();
    addresses = AccountsClient().getAddresses();
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
        title: '배송지 관리',
        actions: const <Widget>[],
      ),
      body: FutureBuilder<List<Address>>(
        future: addresses,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Address address = snapshot.requireData[index];
                        return AddressBox(address);
                      },
                      itemCount: snapshot.requireData.length,
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
