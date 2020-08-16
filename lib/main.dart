import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        hintColor: Colors.indigo[200],//red color: Color(0x0ffffefee),
        primaryColor: Colors.deepPurple,
        accentColor: Color(0xFFFEF9EB),
        hoverColor: Colors.white60,
        fontFamily: 'Questrial'
      ),
      home: HomeScreen(),
    );
  }
}

