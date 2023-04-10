import 'package:flutter/material.dart';
import 'package:pokedex_flutter/screens/home_screen/home_screen.dart';
import 'package:pokedex_flutter/service/pokemon_service.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
      ),
      initialRoute: "home",
      routes: {
        "home": (context) => HomeScreen(),
      },
    );
  }
}
