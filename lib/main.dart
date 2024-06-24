import 'package:calculadora_grupal/Screens/CalculadoraAvanzada.dart';
import 'package:calculadora_grupal/ModoOscuro/DarkMode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DarkMode(),
      child: Consumer<DarkMode>(
        builder: (context, darkMode, child) {
          return MaterialApp(
            title: 'Calculadora avanzada',
            theme: darkMode.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const CalculadoraAvanzada(),
          );
        },
      ),
    );
  }
}
