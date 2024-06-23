// ignore_for_file: file_names
import 'package:calculadora_grupal/DarkMode.dart';
import 'package:calculadora_grupal/PantallaConfiguracion.';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculadoraAvanzada extends StatefulWidget {
  const CalculadoraAvanzada({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculadoraAvanzadaState createState() => _CalculadoraAvanzadaState();
}

class _CalculadoraAvanzadaState extends State<CalculadoraAvanzada> {
  bool scientificKeyboard = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkMode>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora - P.A'),
        actions: [
          IconButton(
            icon: Icon(
              darkMode.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () {
              darkMode.toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PantallaConfiguracion()),
              );
            },
          ),
        ],
      ),
    );
  }
}
