import 'package:flutter/material.dart';
import 'package:flutter_challenge/model/JokesApi.dart';
import 'package:flutter_challenge/providers/user_data_provider.dart';

import 'base_repository.dart';

class UserDataRepository extends BaseRepository {
  UserDataProvider userDataProvider = UserDataProvider();

  @override
  void dispose() {}

  Future<JokesApi> getJokes({
    Map data,
    BuildContext context,
  }) async =>
      await userDataProvider.getJokes(data: data, context: context);
}
