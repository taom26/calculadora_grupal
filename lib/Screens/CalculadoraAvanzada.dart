// ignore_for_file: file_names
import 'package:calculadora_grupal/CustomWidgets/CustomAppBar.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomIconButton.dart';
import 'package:calculadora_grupal/ModoOscuro/DarkMode.dart';
import 'package:calculadora_grupal/Screens/PantallaConfiguracion';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculadoraAvanzada extends StatefulWidget {
  const CalculadoraAvanzada({super.key});

  @override
  _CalculadoraAvanzadaState createState() => _CalculadoraAvanzadaState();
}

class _CalculadoraAvanzadaState extends State<CalculadoraAvanzada> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkMode>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Calculadora - P.A',
        actions: [
          CustomIconButton(
            icon: darkMode.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            onPressed: () {
              darkMode.toggleTheme();
            },
          ),
          CustomIconButton(
            icon: Icons.settings,
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
      body: const Center(),
    );
  }
}
