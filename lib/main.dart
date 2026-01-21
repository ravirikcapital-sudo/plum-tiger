//Package Import
import 'package:flutter/material.dart';
import 'root/root.dart';

//Website Main Function
void main() {
  runApp(const RikCapital());
}

class RikCapital
    extends
        StatelessWidget //RikCapital Class
        {
  const RikCapital({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData //Light theme code
      (brightness: Brightness.light, primaryColor: Colors.white),

      darkTheme: ThemeData //Dark theme code
      (brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),

      themeMode: ThemeMode.system, //System default theme code

      title: 'Rik Capital: Capital Market Consultancy Firm', //Title code

      debugShowCheckedModeBanner: false, //Banner code

      initialRoute: '/', //Initial routing code
      routes: {
        '/':
            (context) =>
                SplashScreenPage(), //Set splash screen page as the entry point
        '/home': (context) => HomePageBar(), // route to home page
      },
    );
  }
}
