import 'dart:convert';

import 'package:brandu/models/account.dart';
import 'package:brandu/providers/main.dart';
import 'package:http/http.dart';

class AccountsClient extends APIClient {
  Future<PointHistory> getPoints() async {
    Response response = await getRequest('/api/v1/accounts/point/');
    if (response.statusCode == 200) {
      return PointHistory.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Error();
  }

  Future<Profile> getProfile() async {
    Response response = await getRequest('/api/v1/accounts/me/');
    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Error();
  }

  Future<List<Address>> getAddresses() async {
    Response response = await getRequest('/api/v1/accounts/address/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => Address.fromJson(model)));
    }
    throw Error();
  }

  Future<bool> postSetMain(int id) async {
    Response response = await postRequest('/api/v1/accounts/address/$id/main/');
    if (response.statusCode == 200) {
      return true;
    }
    throw Error();
  }

  Future<bool> patchAddress(int id, Address address) async {
    Response response = await patchRequest(
      '/api/v1/accounts/address/$id/',
      body: jsonEncode(address.toJson()),
    );
    if (response.statusCode == 200) {
      return true;
    }
    throw Error();
  }

  Future<Notify> getNotify() async {
    Response response = await getRequest('/api/v1/accounts/notify/');
    if (response.statusCode == 200) {
      return Notify.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Error();
  }

  Future<List<Review>> getReviews() async {
    Response response = await getRequest('/api/v1/accounts/review/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => Review.fromJson(model)));
    }
    throw Error();
  }

  Future<List<Bucket>> getFavorites() async {
    Response response = await getRequest('/api/v1/accounts/wishes/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => Bucket.fromJson(model)));
    }
    throw Error();
  }

  Future<List<Bucket>> getBuckets() async {
    Response response = await getRequest('/api/v1/accounts/buckets/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => Bucket.fromJson(model)));
    }
    throw Error();
  }

  Future<bool> patchFavorite(int id) async {
    Response response = await patchRequest('/api/v1/accounts/bucket/$id/');
    if (response.statusCode == 200) {
      return true;
    }
    throw Error();
  }

  Future<bool> deleteBucket(int id) async {
    Response response = await deleteRequest('/api/v1/accounts/bucket/$id/');
    if (response.statusCode == 204) {
      return true;
    }
    throw Error();
  }
}
