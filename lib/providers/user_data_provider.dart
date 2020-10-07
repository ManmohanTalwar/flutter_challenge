import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_challenge/components/Helper.dart';
import 'package:flutter_challenge/config/config.dart';
import 'package:flutter_challenge/model/JokesApi.dart';
import 'package:flutter_challenge/providers/base_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserDataProvider extends BaseUserDataProvider {
  @override
  void dispose() {}

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  Future<JokesApi> getJokes({
    Map data,
    BuildContext context,
  }) async {
    String url = Config.getJokes(
      firstName: data['firstName'],
      lastName: data['lastName'],
    );
    print('[URL]: $url');
    Response response = await http.get(
      url,
      headers: headers,
    );
    var jsonResp = json.decode(utf8.decode(response.bodyBytes));
    print('[RESP]: $jsonResp ');
    if (jsonResp['type'] == 'success') {
      JokesApi jokesApi = JokesApi.fromJson(jsonResp);
      return Future.value(jokesApi);
    } else {
      Helper.showErrorToast(context: context, text: 'Some Error Occurred');
      return null;
    }
  }
}
