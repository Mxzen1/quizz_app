import 'package:quizz_app/screens/end_screen.dart';
import 'package:quizz_app/util/questions.dart';
import 'package:quizz_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/guess': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String?;
          return guessMenu(playerName: args ?? "Player"); 
        },
      '/winner': (context) {
        final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        return Winner(
          playerName: args['playerName'],
          correctAnswers: args['correctAnswers'],
        );
      },

      },
    );
  }
}