import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final bool isCorrect =
                  data['user_answer'] == data['correct_answer'];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: isCorrect
                        ? const Color.fromARGB(255, 119, 214, 122)
                        : const Color.fromARGB(255, 230, 115, 111),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 209, 208, 208),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
