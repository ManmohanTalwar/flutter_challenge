import 'package:flutter_challenge/providers/user_data_provider.dart';

import 'base_repository.dart';

class UserDataRepository extends BaseRepository {
  UserDataProvider userDataProvider = UserDataProvider();

  @override
  void dispose() {}

  Future<bool> updateUserPassword(String currentPassword, String password) =>
      null;
}
