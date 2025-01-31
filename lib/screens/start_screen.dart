import 'package:flutter/material.dart';
import 'package:flutter_application_9/survey_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background image container
      body: Container(
        decoration: BoxDecoration( // Removed 'const' to allow dynamic loading
          image: DecorationImage(
            image: AssetImage('lib/assets/images/lotus.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        // Centered button
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the SurveyPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SurveyPage()),
              );
            },
            child: const Text('Start Survey'),
          ),
        ),
      ),
    );
  }
}
