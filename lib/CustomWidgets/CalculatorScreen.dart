import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculadora_grupal/CustomWidgets/CustomButton.dart';

class CalculatorScreen extends StatefulWidget {
  final Function(String) onAddHistory;

  const CalculatorScreen({Key? key, required this.onAddHistory})
      : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String operation = "";

  void appendOperation(String value) {
    setState(() {
      operation += value;
    });
  }

  void deleteLastCharacter() {
    setState(() {
      if (operation.isNotEmpty) {
        operation = operation.substring(0, operation.length - 1);
      }
    });
  }

  void calculateResult() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(operation);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      String formattedResult;
      if (result == result.toInt()) {
        formattedResult = result.toInt().toString();
      } else {
        formattedResult = result.toStringAsFixed(3);
      }

      setState(() {
        widget.onAddHistory('$operation = $formattedResult');
        operation = formattedResult;
      });
    } catch (e) {
      setState(() {
        operation = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(50),
              decoration: const BoxDecoration(),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle:
                      TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                controller: TextEditingController(text: operation),
                readOnly: true,
                textAlign: TextAlign.right,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Table(
              children: [
                TableRow(
                  children: [
                    CustomButton(
                      label: 'C',
                      color: Colors.redAccent.shade100,
                      onPressed: () {
                        setState(() {
                          operation = "";
                        });
                      },
                    ),
                    CustomButton(
                      icon: Icons.backspace,
                      color: Colors.redAccent.shade100,
                      onPressed: deleteLastCharacter,
                    ),
                    CustomButton(
                      label: '1/x',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation("1/"),
                    ),
                    CustomButton(
                      label: '√',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation("sqrt("),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    CustomButton(
                      label: '7',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('7'),
                    ),
                    CustomButton(
                      label: '8',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('8'),
                    ),
                    CustomButton(
                      label: '9',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('9'),
                    ),
                    CustomButton(
                      label: '/',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('/'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    CustomButton(
                      label: '4',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('4'),
                    ),
                    CustomButton(
                      label: '5',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('5'),
                    ),
                    CustomButton(
                      label: '6',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('6'),
                    ),
                    CustomButton(
                      label: '*',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('*'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    CustomButton(
                      label: '1',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('1'),
                    ),
                    CustomButton(
                      label: '2',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('2'),
                    ),
                    CustomButton(
                      label: '3',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('3'),
                    ),
                    CustomButton(
                      label: '-',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('-'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    CustomButton(
                      label: '0',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('0'),
                    ),
                    CustomButton(
                      label: '.',
                      color: Colors.greenAccent.shade100,
                      onPressed: () => appendOperation('.'),
                    ),
                    CustomButton(
                      label: '^',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('^'),
                    ),
                    CustomButton(
                      label: '+',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('+'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    CustomButton(
                      label: '^2',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('^2'),
                    ),
                    CustomButton(
                      label: '!',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('!'),
                    ),
                    CustomButton(
                      label: '(',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('('),
                    ),
                    CustomButton(
                      label: ')',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation(')'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    CustomButton(
                      label: 'ln',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('ln('),
                    ),
                    CustomButton(
                      label: 'log',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('log('),
                    ),
                    CustomButton(
                      label: 'e',
                      color: const Color.fromARGB(255, 255, 255, 88),
                      onPressed: () => appendOperation('2.71828'),
                    ),
                    CustomButton(
                      label: '=',
                      color: const Color.fromARGB(255, 68, 255, 246),
                      onPressed: calculateResult,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
