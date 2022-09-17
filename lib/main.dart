import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'People in Space NOW',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.firaSans().fontFamily,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: GoogleFonts.firaSans().fontFamily,
            ),
        primaryTextTheme: ThemeData.dark().textTheme.apply(
              fontFamily: GoogleFonts.firaSans().fontFamily,
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
