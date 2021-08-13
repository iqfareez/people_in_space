import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:people_in_space/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'People in Space NOW',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.firaSans().fontFamily,
      ),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
