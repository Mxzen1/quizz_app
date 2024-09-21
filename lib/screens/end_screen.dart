import 'package:flutter/material.dart';

class Winner extends StatelessWidget {
  final String playerName; 
  final int correctAnswers; 

  const Winner({super.key, required this.playerName, required this.correctAnswers}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Positioned(
              top: 300,
              left: 50,
              child: Container(
                width: 320,
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(29, 4, 151, 114),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            Positioned(
              top: 330,
              left: 70,
              child: Column(
                children: [
                  Text(
                    'Hello $playerName!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'YOUR SCORE IS : $correctAnswers/5.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 450,
              left: 160,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(184, 232, 147, 1),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.35),
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(184, 232, 147, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'CONGRATULATIONS!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}