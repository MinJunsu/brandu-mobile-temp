import 'dart:convert';

import 'package:brandu/models/service.dart';
import 'package:brandu/providers/main.dart';
import 'package:http/http.dart';

class ServiceClient extends APIClient {
  Future<List<Notice>> getNotices() async {
    Response response = await getRequest('/api/v1/services/notice/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => Notice.fromJson(model)));
    }
    throw Error();
  }

  Future<List<Inquiry>> getInquiries() async {
    Response response = await getRequest('/api/v1/services/inquiry/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => Inquiry.fromJson(model)));
    }
    throw Error();
  }

  Future<Inquiry> postInquiry(String title, String description) async {
    Response response = await postRequest('/api/v1/services/inquiry/', body: {
      'title': title,
      'description': description,
    });
    if (response.statusCode == 201) {
      return Inquiry.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Error();
  }

  Future<Inquiry> patchInquiry(int id, String title, String description) async {
    Response response =
        await patchRequest('/api/v1/services/inquiry/$id/', body: {
      'title': title,
      'description': description,
    });
    print(description);
    print(jsonDecode(utf8.decode(response.bodyBytes)));
    if (response.statusCode == 200) {
      return Inquiry.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Error();
  }

  Future<bool> deleteInquiry(int id) async {
    Response response = await deleteRequest('/api/v1/services/inquiry/$id/');
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    throw Error();
  }

  Future<Services> getServices() async {
    Response response = await getRequest('/api/v1/services/');
    if (response.statusCode == 200) {
      return Services.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Error();
  }

  Future<PaginatedMainInfo> getMainInfos() async {
    Response response = await getRequest('/api/v1/services/main-info/');
    if (response.statusCode == 200) {
      return PaginatedMainInfo.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Error();
  }

  Future<PaginatedFAQ> getFAQs() async {
    Response response = await getRequest('/api/v1/services/faq/');
    if (response.statusCode == 200) {
      return PaginatedFAQ.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Error();
  }
}
