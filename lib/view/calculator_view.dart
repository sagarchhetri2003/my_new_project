// import 'package:flutter/material.dart';

// class CalculatorView extends StatefulWidget {
//   const CalculatorView({super.key});

//   @override
//   State<CalculatorView> createState() => _CalculatorViewState();
// }

// class _CalculatorViewState extends State<CalculatorView> {
//   String expression = ""; // The full input expression
//   String result = "0"; // The calculated result

//   final List<String> buttons = [
//     "C",
//     "*",
//     "/",
//     "<-",
//     "1",
//     "2",
//     "3",
//     "+",
//     "4",
//     "5",
//     "6",
//     "-",
//     "7",
//     "8",
//     "9",
//     "*",
//     "%",
//     "0",
//     ".",
//     "=",
//   ];

//   /// Evaluates the expression following DMAS rules
//   String evaluateExpression(String expr) {
//     try {
//       // Handle modulo and standard DMAS operations
//       final numbers = <double>[];
//       final operators = <String>[];

//       String currentNumber = "";
//       for (int i = 0; i < expr.length; i++) {
//         String char = expr[i];

//         if ("0123456789.".contains(char)) {
//           currentNumber += char;
//         } else if ("/*-+%".contains(char)) {
//           numbers.add(double.parse(currentNumber));
//           operators.add(char);
//           currentNumber = "";
//         }
//       }
//       numbers.add(double.parse(currentNumber));

//       // Perform DMAS operations
//       for (String op in ["/", "*", "%", "+", "-"]) {
//         while (operators.contains(op)) {
//           int index = operators.indexOf(op);

//           double num1 = numbers[index];
//           double num2 = numbers[index + 1];
//           double result;

//           switch (op) {
//             case "/":
//               result = num1 / num2;
//               break;
//             case "*":
//               result = num1 * num2;
//               break;
//             case "%":
//               result = num1 % num2;
//               break;
//             case "+":
//               result = num1 + num2;
//               break;
//             case "-":
//               result = num1 - num2;
//               break;
//             default:
//               throw Exception("Invalid operator");
//           }

//           numbers[index] = result;
//           numbers.removeAt(index + 1);
//           operators.removeAt(index);
//         }
//       }

//       return numbers[0].toString();
//     } catch (e) {
//       return "Error";
//     }
//   }

//   void buttonPressed(String buttonText) {
//     setState(() {
//       if (buttonText == "C") {
//         expression = "";
//         result = "0";
//       } else if (buttonText == "<-") {
//         // Backspace
//         if (expression.isNotEmpty) {
//           expression = expression.substring(0, expression.length - 1);
//         }
//       } else if (buttonText == "=") {
//         result = evaluateExpression(expression);
//       } else {
//         expression += buttonText;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Enhanced DMAS Calculator")),
//       body: Column(
//         children: [
//           // Display for expression
//           Expanded(
//             flex: 2,
//             child: Container(
//               alignment: Alignment.centerRight,
//               padding: const EdgeInsets.all(24),
//               child: Text(
//                 expression,
//                 style:
//                     const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           // Display for result
//           Expanded(
//             flex: 1,
//             child: Container(
//               alignment: Alignment.centerRight,
//               padding: const EdgeInsets.all(24),
//               child: Text(
//                 result,
//                 style: const TextStyle(fontSize: 36, color: Colors.green),
//               ),
//             ),
//           ),
//           // Buttons grid
//           Expanded(
//             flex: 5,
//             child: GridView.builder(
//               itemCount: buttons.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//               ),
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () => buttonPressed(buttons[index]),
//                   child: Container(
//                     margin: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: buttons[index] == "=" ||
//                               buttons[index] == "+" ||
//                               buttons[index] == "-" ||
//                               buttons[index] == "*" ||
//                               buttons[index] == "/" ||
//                               buttons[index] == "%"
//                           ? Colors.orange
//                           : Colors.grey[800],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Center(
//                       child: Text(
//                         buttons[index],
//                         style:
//                             const TextStyle(fontSize: 24, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String expression = ""; // The full input expression
  String result = "0"; // The calculated result

  final List<String> buttons = [
    "C",
    "<-",
    "%",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "=",
  ];

  /// Evaluates the expression following DMAS rules
  String evaluateExpression(String expr) {
    try {
      final numbers = <double>[];
      final operators = <String>[];

      String currentNumber = "";
      for (int i = 0; i < expr.length; i++) {
        String char = expr[i];

        if ("0123456789.".contains(char)) {
          currentNumber += char;
        } else if ("/*-+%".contains(char)) {
          numbers.add(double.parse(currentNumber));
          operators.add(char);
          currentNumber = "";
        }
      }
      numbers.add(double.parse(currentNumber));

      for (String op in ["/", "*", "%", "+", "-"]) {
        while (operators.contains(op)) {
          int index = operators.indexOf(op);

          double num1 = numbers[index];
          double num2 = numbers[index + 1];
          double result;

          switch (op) {
            case "/":
              result = num1 / num2;
              break;
            case "*":
              result = num1 * num2;
              break;
            case "%":
              result = num1 % num2;
              break;
            case "+":
              result = num1 + num2;
              break;
            case "-":
              result = num1 - num2;
              break;
            default:
              throw Exception("Invalid operator");
          }

          numbers[index] = result;
          numbers.removeAt(index + 1);
          operators.removeAt(index);
        }
      }

      return numbers[0].toString();
    } catch (e) {
      return "Error";
    }
  }

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        expression = "";
        result = "0";
      } else if (buttonText == "<-") {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (buttonText == "=") {
        result = evaluateExpression(expression);
      } else {
        expression += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enhanced DMAS Calculator")),
      body: Column(
        children: [
          // Display for expression
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  expression,
                  style: const TextStyle(
                      fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // Display for result
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                result,
                style: const TextStyle(fontSize: 36, color: Colors.green),
              ),
            ),
          ),
          // Buttons grid
          Expanded(
            flex: 5,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.1, // Adjusted aspect ratio to fit buttons
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => buttonPressed(buttons[index]),
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: buttons[index] == "=" ||
                              buttons[index] == "+" ||
                              buttons[index] == "-" ||
                              buttons[index] == "*" ||
                              buttons[index] == "/" ||
                              buttons[index] == "%"
                          ? Colors.orange
                          : Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        buttons[index],
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
