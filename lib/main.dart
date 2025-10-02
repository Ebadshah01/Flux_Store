import 'package:flutter/material.dart';
import 'package:fluxstore/provider/favorite_provider.dart';
import 'package:fluxstore/provider/signin_provider.dart';
import 'package:fluxstore/provider/theme_change_provider.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/splash_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ThemeChangeProvider()),
        ChangeNotifierProvider(create: (_)=> FavoriteItem()),
        ChangeNotifierProvider(create: (_) => SigninProvider())],
      child:Builder(builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        final ThemeChanger =Provider.of<ThemeChangeProvider>(context);
        return MaterialApp(
  title: 'Flux Store',
  themeMode: ThemeChanger.thememode,
     // 👈 yeh add karo
     
theme: ThemeData(
  
  brightness: Brightness.light,
  scaffoldBackgroundColor: whitethemecolor,
  colorScheme: ColorScheme.light(
    primary: themeprimarycolor,
    secondary: bluethemecolor,
  ),
  textTheme: GoogleFonts.poppinsTextTheme()
  // const TextTheme(
    
  //   titleLarge: TextStyle(color: Colors.black),  // Headings
  //   bodyLarge: TextStyle(color: Colors.black),   // Big text
  //   bodyMedium: TextStyle(color: Colors.black87), // Normal text
  // ),
),

darkTheme: ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: blackthemecolor,
  colorScheme: ColorScheme.dark(
    primary: themeprimarycolor,
    secondary: bluethemecolor,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.white),   // Headings
    bodyLarge: TextStyle(color: Colors.white),    // Big text
    bodyMedium: TextStyle(color: Colors.white70), // Normal text
  ),
),

  debugShowCheckedModeBanner: false,
  builder: (context, child) => ResponsiveBreakpoints.builder(
    child: BouncingScrollWrapper.builder(context, child!),
    breakpoints: [
      const Breakpoint(start: 0, end: 480, name: MOBILE),
      const Breakpoint(start: 481, end: 800, name: TABLET),
      const Breakpoint(start: 801, end: 1200, name: DESKTOP),
      const Breakpoint(start: 1201, end: double.infinity, name: '4K'),
    ],
  ),
  home: SplashScreen(),
);

      })
    );
  }
}
