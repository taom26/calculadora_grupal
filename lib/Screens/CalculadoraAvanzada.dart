import 'package:calculadora_grupal/CustomWidgets/CustomAppBar.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomIconButton.dart';
import 'package:calculadora_grupal/ModoOscuro/DarkMode.dart';
import 'package:calculadora_grupal/Screens/PantallaConfiguracion';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomDrawer.dart'; // Importa el nuevo widget personalizado

class CalculadoraAvanzada extends StatefulWidget {
  const CalculadoraAvanzada({Key? key})
      : super(key: key); // Corrige el constructor

  @override
  _CalculadoraAvanzadaState createState() => _CalculadoraAvanzadaState();
}

class _CalculadoraAvanzadaState extends State<CalculadoraAvanzada> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

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
                    builder: (context) => const PantallaConfiguracion()),
              );
            },
          ),
        ],
        onDrawerPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      drawer: const CustomDrawer(), // Usa el widget personalizado CustomDrawer
      body: const Center(),
    );
  }
}
