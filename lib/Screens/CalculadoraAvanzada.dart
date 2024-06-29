// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculadora_grupal/CustomWidgets/CalculatorScreen.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomAppBar.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomIconButton.dart';
import 'package:calculadora_grupal/ModoOscuro/DarkMode.dart';
import 'package:calculadora_grupal/Screens/PantallaConfiguracion';
import 'package:calculadora_grupal/CustomWidgets/CustomDrawer.dart';

class CalculadoraAvanzada extends StatefulWidget {
  const CalculadoraAvanzada({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculadoraAvanzadaState createState() => _CalculadoraAvanzadaState();
}

class _CalculadoraAvanzadaState extends State<CalculadoraAvanzada> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkMode>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: 'Calculadora',
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
                  builder: (context) => PantallaConfiguracion(),
                ),
              );
            },
          ),
        ],
        onDrawerPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: <Widget>[
          CalculatorScreen(onAddHistory: (history) {}),
        ],
      ),
    );
  }
}
