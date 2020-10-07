import 'package:flutter/material.dart';

@immutable
abstract class JokesEvents {}

class GetJokes extends JokesEvents {
  final Map<String, dynamic> data;
  final BuildContext context;
  GetJokes(
    this.data,
    this.context,
  );
}
