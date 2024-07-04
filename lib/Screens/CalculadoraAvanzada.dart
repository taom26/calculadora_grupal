// ignore_for_file: file_names, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomHistory.dart';
import 'package:calculadora_grupal/CustomWidgets/CalculatorScreen.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomAppBar.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomIconButton.dart';
import 'package:calculadora_grupal/ModoOscuro/DarkMode.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomDrawer.dart';
import 'package:provider/provider.dart';

class CalculadoraAvanzada extends StatefulWidget {
  const CalculadoraAvanzada({super.key});

  @override
  _CalculadoraAvanzadaState createState() => _CalculadoraAvanzadaState();
}

class _CalculadoraAvanzadaState extends State<CalculadoraAvanzada> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> history = [];

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
            icon: Icons.history,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomHistory(history: history),
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
      body: Column(children: <Widget>[
        Expanded(
          flex: 1,
          child: CalculatorScreen(
            onAddHistory: (historyEntry) {
              setState(() {
                history.add(historyEntry);
              });
            },
          ),
        )
      ]),
    );
  }
}
