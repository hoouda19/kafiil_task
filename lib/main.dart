import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kafiil_taskt/domain/services_view_provider.dart';
import 'package:kafiil_taskt/domain/token.dart';
import 'package:kafiil_taskt/presentation/constants/favourite_social_list.dart';
import 'package:kafiil_taskt/presentation/screens/home_screen.dart';

import 'package:kafiil_taskt/presentation/screens/log_in_screen.dart';
import 'package:provider/provider.dart';
import 'domain/countries_provider.dart';
import 'domain/login_provider.dart';
import 'domain/person_account_provider.dart';
import 'domain/user_profile_provider.dart';
import 'presentation/screens/register_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServicesViewModel()),
        ChangeNotifierProvider(create: (_) => CountriesProvider()),
        ChangeNotifierProvider(create: (_) => PersonAccountProvider()),
        ChangeNotifierProvider(create: (_) => Token()),
        ChangeNotifierProvider(create: (_) => FavouriteSocialList()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            title: 'Kafiil',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.montserratTextTheme(
                Theme.of(context).textTheme,
              ),
              scaffoldBackgroundColor: Colors.grey[100],
              colorScheme: const ColorScheme.light(
                primary: Color.fromARGB(255, 29, 191, 115),
                secondary: Color.fromARGB(255, 29, 191, 115),
              ),
              useMaterial3: true,
            ),
            routes: {
              '/': (context) => child!,
              '/register': (context) => const RegisterScreen(),
              '/homescreen': (context) => const HomeScreen()
            },
          );
        },
        child: LogInScreen());
  }
}
