import 'package:calculadora_grupal/CalculadoraAvanzada.dart';
import 'package:calculadora_grupal/DarkMode.dart';
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
        builder: (context, wallpaperProvider, child) {
          return MaterialApp(
            title: 'Calculadora',
            theme: wallpaperProvider.isDarkMode
                ? ThemeData.dark()
                : ThemeData.light(),
            home: const CalculadoraAvanzada(),
          );
        },
      ),
    );
  }
}
