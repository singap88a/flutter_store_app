import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/screens/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Electrical Store',
        theme: ThemeData(
          textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
          primaryColor: kPrimaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kPrimaryColor),
        ),
        // Arabic RTL
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [Locale("ar", "AE")],
        locale: Locale("ar", "AE"),

        home: MainScreen(),
      ),
    );
  }
}
