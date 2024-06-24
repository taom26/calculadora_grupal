import 'package:flutter/material.dart';
import 'package:calculadora_grupal/Screens/PantallaConfiguracion';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

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
                color: Colors.white, // Establece el color del texto como blanco
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Configuración'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PantallaConfiguracion(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
