import 'package:flutter/material.dart';

void main() {
  runApp(const StartScreen());
}

class StartScreen extends StatelessWidget {
  const StartScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Quality Prototype',
      // REMOVE the debug banner
      debugShowCheckedModeBanner: false,
      
      // Change the theme color here
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // Optional: you can adjust the AppBar theme specifically
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      home: const SurveyPage(),
    );
  }
}

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  // List of response options
  final List<String> _responseOptions = [
    'Excellent',
    'Good',
    'Neutral',
    'Poor',
    'Very Poor',
  ];

  // Selected responses for each question
  String? _q1Response;
  String? _q2Response;
  String? _q3Response;
  String? _q4Response;
  String? _q5Response;

  // Handle submission
  void _handleSubmit() {
    // Check if all questions are answered
    if (_q1Response == null ||
        _q2Response == null ||
        _q3Response == null ||
        _q4Response == null ||
        _q5Response == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please respond to all questions before submitting.'),
        ),
      );
      return;
    }

    // Show summary dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Survey Submitted'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1) Air Freshness: $_q1Response'),
            Text('2) Temperature Comfort: $_q2Response'),
            Text('3) Dust/Cleanliness: $_q3Response'),
            Text('4) Odors/Smells: $_q4Response'),
            Text('5) Overall Air Quality: $_q5Response'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Reset answers (optional)
              setState(() {
                _q1Response = null;
                _q2Response = null;
                _q3Response = null;
                _q4Response = null;
                _q5Response = null;
              });
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Helper widget to build each question
  Widget _buildQuestion({
    required String questionText,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // Build RadioListTiles for each option
        ..._responseOptions.map(
          (option) => RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selectedValue,
            onChanged: onChanged,
          ),
        ),
        const Divider(thickness: 1, height: 32),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Quality Feedback'),
      ),
      body: Container(
        // Background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Please let us know how you feel about the office air quality.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Question 1
                _buildQuestion(
                  questionText: '1) Do you find the air fresh?',
                  selectedValue: _q1Response,
                  onChanged: (value) => setState(() {
                    _q1Response = value;
                  }),
                ),

                // Question 2
                _buildQuestion(
                  questionText: '2) Are you comfortable with the temperature?',
                  selectedValue: _q2Response,
                  onChanged: (value) => setState(() {
                    _q2Response = value;
                  }),
                ),

                // Question 3
                _buildQuestion(
                  questionText: '3) How would you describe dust/cleanliness?',
                  selectedValue: _q3Response,
                  onChanged: (value) => setState(() {
                    _q3Response = value;
                  }),
                ),

                // Question 4
                _buildQuestion(
                  questionText: '4) Any odors or unpleasant smells?',
                  selectedValue: _q4Response,
                  onChanged: (value) => setState(() {
                    _q4Response = value;
                  }),
                ),

                // Question 5
                _buildQuestion(
                  questionText: '5) Overall, how would you rate the air quality?',
                  selectedValue: _q5Response,
                  onChanged: (value) => setState(() {
                    _q5Response = value;
                  }),
                ),

                // Submit button
                ElevatedButton(
                  onPressed: _handleSubmit,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
