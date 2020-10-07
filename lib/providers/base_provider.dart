import 'package:flutter/material.dart';

abstract class BaseProvider {
  void dispose();
}

abstract class BaseUserDataProvider extends BaseProvider {
  Future<void> getJokes({
    Map data,
    BuildContext context,
  });
}
