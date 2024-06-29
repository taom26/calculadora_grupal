import 'package:calculadora_grupal/Screens/CalculadoraAvanzada.dart';
import 'package:calculadora_grupal/ModoOscuro/DarkMode.dart';
import 'package:calculadora_grupal/Screens/LanguageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DarkMode(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DarkMode()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: Consumer<DarkMode>(
        builder: (context, darkMode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Calculadora avanzada',
            theme: darkMode.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const CalculadoraAvanzada(),
          );
        },
      ),
    );
  }
}
