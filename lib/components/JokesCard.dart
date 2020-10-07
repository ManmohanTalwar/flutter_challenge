import 'package:flutter/material.dart';
import 'package:flutter_challenge/components/round_icon_button.dart';
import 'package:flutter_challenge/model/JokesApi.dart';
import 'package:flutter_challenge/utils/app_constants.dart';

class JokesCard extends StatelessWidget {
  final Joke joke;
  final Function previousCard;
  final Function nextCard;

  JokesCard({
    this.joke,
    this.nextCard,
    this.previousCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.4),
//        border: Border.all(
//          color: AppConstants.black.withOpacity(0.5),
//        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          RoundIconButton(
            icon: Icons.arrow_upward,
            onPressed: previousCard,
            iconColor: AppConstants.black,
            color: AppConstants.white,
          ),
          Spacer(),
          Material(
            borderRadius: BorderRadius.circular(12.0),
            elevation: 6.0,
            animationDuration: Duration(milliseconds: 200),
            type: MaterialType.card,
//            color: AppConstants.greenish,
            borderOnForeground: true,
            child: Container(
              padding: const EdgeInsets.all(6.0),
              height: 260.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ResizeImage(
                      AssetImage('assets/images/jokebg.jpg'),
                      allowUpscaling: true,
                      width: 768,
                      height: 480,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      joke.joke,
                      style: AppConstants.customStyleSpacing(
                        color: AppConstants.black,
                        weight: FontWeight.bold,
                        size: 18.0,
                        style: FontStyle.italic,
                        letterSpace: 2.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          RoundIconButton(
            icon: Icons.arrow_downward,
            onPressed: nextCard,
            color: AppConstants.white,
            iconColor: AppConstants.black,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
