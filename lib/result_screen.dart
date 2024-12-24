import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.startQuiz, {
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numTotalCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numTotalCorrectQuestions out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 209, 208, 208),
                  fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
