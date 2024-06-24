import 'package:flutter/material.dart';
import 'package:calculadora_grupal/Screens/PantallaConfiguracion'; // Asegúrate de importar correctamente PantallaConfiguracion.dart

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
              color: Color.fromARGB(255, 95, 11, 11),
            ),
            child: Text('Super calculadora'),
          ),
          ListTile(
            title: const Text('Configuración'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PantallaConfiguracion()),
              );
            },
          ),
          // Agrega más opciones para el Drawer según necesites
        ],
      ),
    );
  }
}
