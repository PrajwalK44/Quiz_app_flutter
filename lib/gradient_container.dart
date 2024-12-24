import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(150, 224, 224, 224),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz!'),
          )
        ],
      ),
    );
  }
}
