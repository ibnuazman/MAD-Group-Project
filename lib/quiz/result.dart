import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_game/screens/profile_page.dart';

class Result extends StatelessWidget {
  int score;
  final VoidCallback resetScore;

  Result(this.score, this.resetScore);

  User? user = FirebaseAuth.instance.currentUser;

  String get resultPhrase {
    String resultText;
    if (score <= 2) {
      resultText =
          'Do not give up, you can try this quiz again. \nYour score is $score';
    } else if (score <= 4) {
      resultText =
          'You did well, but you could do it better.\nYour score is $score';
    } else {
      resultText =
          'Well done! You are so briliant and amazing !\nYour score is $score';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          resultPhrase,
          style: const TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: resetScore,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red[100]),
              foregroundColor: MaterialStateProperty.all(Colors.black)),
          child: const Text(
            'Try again',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  user: user!,
                ),
              ),
            );
          },
          child: const Text('Back to Home'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        )
      ],
    );
  }
}
