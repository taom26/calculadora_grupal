import 'dart:math';

import 'package:calculadora_grupal/CustomWidgets/CustomAppBar.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomIconButton.dart';
import 'package:calculadora_grupal/ModoOscuro/DarkMode.dart';
import 'package:calculadora_grupal/Screens/PantallaConfiguracion';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomDrawer.dart'; // Importa el nuevo widget personalizado
import 'dart:math';

class CalculadoraAvanzada extends StatefulWidget {
  const CalculadoraAvanzada({Key? key}) : super(key: key);

  @override
  _CalculadoraAvanzadaState createState() => _CalculadoraAvanzadaState();
}

class _CalculadoraAvanzadaState extends State<CalculadoraAvanzada> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _output = "0";
  String _input = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _input = "";
      _num1 = 0;
      _num2 = 0;
      _operator = "";
      _output = "0";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "÷" ||
        buttonText == "√" ||
        buttonText == "%" ||
        buttonText == "x^2" ||
        buttonText == "1/x") {
      if (_input.isNotEmpty) {
        _num1 = double.parse(_input);
        _operator = buttonText;
        _input = "";
      }
    } else if (buttonText == "=") {
      if (_input.isNotEmpty) {
        _num2 = double.parse(_input);
      }
      if (_operator == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operator == "-") {
        _output = (_num1 - _num2).toString();
      } else if (_operator == "x") {
        _output = (_num1 * _num2).toString();
      } else if (_operator == "÷") {
        _output = (_num1 / _num2).toString();
      } else if (_operator == "√") {
        _output = sqrt(_num1).toString();
      } else if (_operator == "%") {
        _output = (_num1 * (_num1 / 100)).toString();
      } else if (_operator == "x^2") {
        _output = (_num1 * _num1).toString();
      } else if (_operator == "1/x") {
        _output = (1 / _num1).toString();
      }
      _input = _output;
      _operator = "";
    } else {
      _input += buttonText;
      _output = _input;
    }
    setState(() {});
  }

  Color _getButtonColor(String label) {
    switch (label) {
      case "C":
      case "⌫":
      case "%":
        return Colors.redAccent.shade100;
      case "÷":
      case "x":
      case "-":
      case "+":
      case "=":
        return Colors.yellowAccent.shade700;
      default:
        return Colors.greenAccent.shade100;
    }
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
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            child: Text(
              _output,
              style: const TextStyle(
                fontSize: 50.0,
                color: Colors.black,
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomButton(
                      label: "%",
                      color: _getButtonColor("%"),
                      onPressed: () => _buttonPressed("%")),
                  CustomButton(
                      label: "C",
                      color: _getButtonColor("C"),
                      onPressed: () => _buttonPressed("C")),
                  CustomButton(
                      label: "⌫",
                      color: _getButtonColor("⌫"),
                      onPressed: () => _buttonPressed("⌫")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomButton(
                      label: "1/x",
                      color: _getButtonColor("1/x"),
                      onPressed: () => _buttonPressed("1/x")),
                  CustomButton(
                      label: "x^2",
                      color: _getButtonColor("x^2"),
                      onPressed: () => _buttonPressed("x^2")),
                  CustomButton(
                      label: "√",
                      color: _getButtonColor("√"),
                      onPressed: () => _buttonPressed("√")),
                  CustomButton(
                      label: "÷",
                      color: _getButtonColor("÷"),
                      onPressed: () => _buttonPressed("÷")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomButton(
                      label: "7",
                      color: _getButtonColor("7"),
                      onPressed: () => _buttonPressed("7")),
                  CustomButton(
                      label: "8",
                      color: _getButtonColor("8"),
                      onPressed: () => _buttonPressed("8")),
                  CustomButton(
                      label: "9",
                      color: _getButtonColor("9"),
                      onPressed: () => _buttonPressed("9")),
                  CustomButton(
                      label: "x",
                      color: _getButtonColor("x"),
                      onPressed: () => _buttonPressed("x")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomButton(
                      label: "4",
                      color: _getButtonColor("4"),
                      onPressed: () => _buttonPressed("4")),
                  CustomButton(
                      label: "5",
                      color: _getButtonColor("5"),
                      onPressed: () => _buttonPressed("5")),
                  CustomButton(
                      label: "6",
                      color: _getButtonColor("6"),
                      onPressed: () => _buttonPressed("6")),
                  CustomButton(
                      label: "-",
                      color: _getButtonColor("-"),
                      onPressed: () => _buttonPressed("-")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomButton(
                      label: "1",
                      color: _getButtonColor("1"),
                      onPressed: () => _buttonPressed("1")),
                  CustomButton(
                      label: "2",
                      color: _getButtonColor("2"),
                      onPressed: () => _buttonPressed("2")),
                  CustomButton(
                      label: "3",
                      color: _getButtonColor("3"),
                      onPressed: () => _buttonPressed("3")),
                  CustomButton(
                      label: "+",
                      color: _getButtonColor("+"),
                      onPressed: () => _buttonPressed("+")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomButton(
                    label: "+/-",
                    color: _getButtonColor("+/-"),
                    onPressed: () => _buttonPressed("+/-"),
                  ),
                  CustomButton(
                    label: "0",
                    color: _getButtonColor("0"),
                    onPressed: () => _buttonPressed("0"),
                  ),
                  CustomButton(
                    label: ".",
                    color: _getButtonColor("."),
                    onPressed: () => _buttonPressed("."),
                  ),
                  CustomButton(
                    label: "=",
                    color: _getButtonColor("="),
                    onPressed: () => _buttonPressed("="),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  CustomButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(18.0),
            textStyle: const TextStyle(fontSize: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(125.0),
            ),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
