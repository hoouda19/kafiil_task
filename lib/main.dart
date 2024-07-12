import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kafiil_taskt/presentation/screens/home_screen.dart';

import 'package:kafiil_taskt/presentation/screens/log_in_screen.dart';
import 'presentation/screens/register_complete_data_screen.dart';
import 'presentation/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kafiil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 29, 191, 115),
          secondary: Color.fromARGB(255, 29, 191, 115),
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => LogInScreen(),
        '/register': (context) => const RegisterScreen(),
        '/registercompletedata': (context) =>
            const RegisterCompleteDataScreen(),
        '/homescreen': (context) => const HomeScreen()
      },
    );
  }
}
