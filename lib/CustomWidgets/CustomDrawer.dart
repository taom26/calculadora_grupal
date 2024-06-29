// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:calculadora_grupal/Screens/PantallaConfiguracion';
import 'package:calculadora_grupal/Screens/CalculadoraAvanzada.dart';

class CustomDrawer extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 100, 20, 20),
            ),
            child: Text(
              'Super calculadora',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const CalculadoraAvanzada(),
                ),
                (route) => false,
              );
            },
          ),
          ListTile(
            title: const Text('Configuración'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PantallaConfiguracion(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
