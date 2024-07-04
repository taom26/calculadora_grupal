// ignore_for_file: library_private_types_in_public_api, file_names
import 'package:flutter/material.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomAppBar.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomDrawer.dart';

class PantallaGIF extends StatefulWidget {
  const PantallaGIF({super.key, required this.gifUrl});

  final String gifUrl;

  @override
  _PantallaGIFState createState() => _PantallaGIFState();
}

class _PantallaGIFState extends State<PantallaGIF> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> history = [];

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Acerca de la aplicación'),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Calculadora Programación Avanzada'),
            Text('Versión: 1.0.0'),
            SizedBox(height: 10),
            Text('Grupo - Programación Avanzada'),
            Text('Davila Carvajal Gabriel Omar'),
            Text('Maliza Anrango Denep Elieser'),
            Text('Tinitana Ortiz Mateo Javier'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: 'GIF',
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showAboutDialog(context),
          ),
        ],
        onDrawerPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Image.network(
          widget.gifUrl,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
