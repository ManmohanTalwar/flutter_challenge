import 'package:flutter/material.dart';
import 'package:flutter_challenge/model/JokesApi.dart';

@immutable
abstract class JokesStates {}

class JokesInitial extends JokesStates {}

class GetJokesInProgressState extends JokesStates {}

class GetJokesFailedState extends JokesStates {}

class GetJokesCompletedState extends JokesStates {
  final JokesApi jokesApi;
  GetJokesCompletedState(this.jokesApi);
}
