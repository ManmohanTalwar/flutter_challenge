import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/blocs/JokesEvents.dart';
import 'package:flutter_challenge/blocs/JokesStates.dart';
import 'package:flutter_challenge/model/JokesApi.dart';
import 'package:flutter_challenge/repositories/user_data_repository.dart';

class JokesBloc extends Bloc<JokesEvents, JokesStates> {
  final UserDataRepository userDataRepository;

  JokesBloc({
    this.userDataRepository,
  }) : super(JokesInitial());

  @override
  Stream<JokesStates> mapEventToState(JokesEvents event) async* {
    if (event is GetJokes) {
      yield* mapJokesToState(event.data, event.context);
    }
  }

  Stream<JokesStates> mapJokesToState(
    Map<String, dynamic> data,
    BuildContext context,
  ) async* {
    yield GetJokesInProgressState();
    try {
      JokesApi jokesApi =
          await userDataRepository.getJokes(context: context, data: data);
      if (jokesApi != null) {
        yield GetJokesCompletedState(jokesApi);
      } else {
        yield GetJokesFailedState();
      }
    } catch (e) {
      print('[Api Error]: $e');
      yield GetJokesFailedState();
    }
  }
}
