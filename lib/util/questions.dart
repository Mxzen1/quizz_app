import 'package:flutter/material.dart';

class guessMenu extends StatefulWidget {
  final String playerName;

  const guessMenu({super.key, required this.playerName});

  @override
  _guessMenuState createState() => _guessMenuState();
}

class _guessMenuState extends State<guessMenu> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Who is the best flutter instructor?',
      'options': ['Mohamed Fahmy', 'Yehia Alaa', 'Mohamed Ahmed', 'Ahmed'],
      'answer': 'Mohamed Fahmy',
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '2', '5'],
      'answer': '4',
    },
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Madrid'],
      'answer': 'Paris',
    },
    {
      'question': 'What is the largest ocean in the world?',
      'options': ['Atlantic Ocean', 'Indian Ocean', 'Pacific Ocean', 'Arctic Ocean'],
      'answer': 'Pacific Ocean',
    },
    {
      'question': 'What is the largest planet in the solar system?',
      'options': ['Jupiter', 'Saturn', 'Uranus', 'Neptune'],
      'answer': 'Jupiter',
    },
  ];

  int currentQuestionIndex = 0;
  String? selectedOption;
  int correctAnswers = 0;

  void nextQuestion() {
    if (selectedOption == questions[currentQuestionIndex]['answer']) {
      correctAnswers++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null;
      });
    } else {
      Navigator.pushNamed(
        context,
        '/winner',
        arguments: {
          'playerName': widget.playerName,
          'correctAnswers': correctAnswers,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(134, 148, 143, 1),
        title: Text(
          'QUIZ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          Image(image: AssetImage('assets/home screen.png')),
          SizedBox(height: 20),
          Center( 
            child: Container(
              width: 300,
              height: 430,
              decoration: BoxDecoration(
                color: Color.fromRGBO(184, 232, 147, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${currentQuestionIndex + 1}/${questions.length}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    currentQuestion['question'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...currentQuestion['options'].map<Widget>((option) {
                    bool isSelected = selectedOption == option;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = option;
                        });
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: selectedOption != null ? nextQuestion : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Next'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
