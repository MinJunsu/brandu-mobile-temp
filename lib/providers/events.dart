import 'dart:convert';

import 'package:brandu/models/event.dart';
import 'package:brandu/providers/main.dart';
import 'package:http/http.dart';

class EventClient extends APIClient {
  Future<List<CouponHold>> getCoupons() async {
    Response response = await getRequest('/api/v1/events/coupons/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => CouponHold.fromJson(model)));
    }
    throw Error();
  }

  Future<CouponHold> postCoupon(String couponNumber) async {
    Response response =
        await postRequest('/api/v1/events/coupons/register/', body: {
      'coupon_number': couponNumber,
    });
    if (response.statusCode == 201) {
      return CouponHold.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Error();
  }
}
