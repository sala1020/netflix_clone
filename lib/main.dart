import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/mainpage/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.dark(),
        scaffoldBackgroundColor: Colors.black,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: TextTheme(
          bodyLarge:TextStyle(color: Colors.white) 
        ),
        useMaterial3: true,
        
      ),
      home: MainPage(),
    );
  }
}
