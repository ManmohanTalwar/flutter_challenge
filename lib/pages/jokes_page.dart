import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/blocs/JokesBloc.dart';
import 'package:flutter_challenge/blocs/JokesEvents.dart';
import 'package:flutter_challenge/blocs/JokesStates.dart';
import 'package:flutter_challenge/components/JokesCard.dart';
import 'package:flutter_challenge/model/JokesApi.dart';
import 'package:flutter_challenge/utils/app_constants.dart';

class JokesPage extends StatefulWidget {
  final Map<String, dynamic> data;
  JokesPage({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  _JokesPageState createState() => _JokesPageState();
}

class _JokesPageState extends State<JokesPage> {
  JokesBloc jokesBloc;
  ScrollController controller;
  @override
  void initState() {
    jokesBloc = BlocProvider.of<JokesBloc>(context);
    jokesBloc.add(GetJokes(widget.data, context));
    controller = ScrollController(keepScrollOffset: true);
    super.initState();
  }

  @override
  void dispose() {
    jokesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        builder: (context, state) {
          if (state is GetJokesInProgressState) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  AppConstants.primaryColor,
                ),
              ),
            );
          } else if (state is GetJokesFailedState) {
            //failed
            return Text(
              'Please Try Again',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            );
          } else if (state is GetJokesCompletedState) {
            // completed
            //todo
            JokesApi jokes = state.jokesApi;
            return jokes.value.length > 0
                ? ListView.builder(
                    itemCount: jokes.value.length,
                    shrinkWrap: true,
                    controller: controller,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => JokesCard(
                      joke: jokes.value[index],
                      previousCard: () {
                        if (index > 0) {
                          controller.animateTo(
                            MediaQuery.of(context).size.height * (index - 1),
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      nextCard: () {
                        if (index < jokes.value.length - 1) {
                          controller.animateTo(
                            MediaQuery.of(context).size.height * (index + 1),
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                  )
                : Container();
          }
          return SizedBox();
        },
        cubit: jokesBloc,
        buildWhen: (previous, current) {
          if (current is GetJokesInProgressState ||
              current is GetJokesCompletedState ||
              current is GetJokesFailedState) {
            return true;
          } else {
            return false;
          }
        },
      ),
    );
  }
}
