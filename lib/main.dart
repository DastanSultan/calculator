import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyDev());

class MyDev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

String but = "";
String nao = "";
double result = 0;

class MyAppState extends State<MyApp> {
  Widget calc(double widths, String btntext, Color colors, double fonts,
      Color btncolor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // if (btntext == 'Dastan') {
          //   btntext = 'Vorname';
          // } else {
          //   print(btntext);
          // }
          if (btntext == "AC") {
            // but = but.replaceAll("8", "0");
            but = '';
            result = 0;
          } else if (btntext == 'delete') {
            if (but.length == 0) {
              but = "0";
            } else {
              but = but.replaceRange(but.length - 1, but.length, '');
            }
            // print(but);
          } else if (btntext == "=") {
            calculate();
          } else {
            but += btntext;
          }
          // print(but.length);
        });
      },
      child: Container(
        width: widths,
        height: 80,
        decoration: BoxDecoration(
          color: btncolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            btntext,
            style: TextStyle(
              color: colors,
              fontSize: fonts,
            ),
          ),
        ),
      ),
    );
  }

  void calculate() {
    Parser p = Parser();
    try {
      Expression exp = p.parse(but);
      ContextModel cont = ContextModel();

      setState(() {
        result = exp.evaluate(EvaluationType.REAL, cont);
      });
    } catch (e) {
      setState(() {
        result = 0;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Ошибка'),
              content: Text('Ошибка! Проверьте еще раз!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF161A30),
      appBar: AppBar(
        backgroundColor: Color(0xFFF31304D),
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 40),
                alignment: Alignment.topRight,
                child: Text(
                  '$but',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "$result",
                  style: TextStyle(color: Colors.white, fontSize: 45),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calc(MediaQuery.of(context).size.width * 0.44, "AC", Colors.black,
                  36, Color.fromARGB(255, 255, 40, 40)),
              // calc("-", Colors.black, 39, Colors.grey),
              calc(MediaQuery.of(context).size.width * 0.2, "delete",
                  Colors.white, 20, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "/", Colors.black,
                  39, Color(0XFFFF2A33C)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calc(MediaQuery.of(context).size.width * 0.2, "7", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "8", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "9", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "*", Colors.black,
                  39, Color(0XFFFF2A33C)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calc(MediaQuery.of(context).size.width * 0.2, "4", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "5", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "6", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "-", Colors.black,
                  39, Color(0XFFFF2A33C)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calc(MediaQuery.of(context).size.width * 0.2, "1", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "2", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "3", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "+", Colors.black,
                  39, Color(0XFFFF2A33C)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calc(MediaQuery.of(context).size.width * 0.2, "%", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "0", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, ".", Colors.white,
                  39, Color(0xFFF5C5E63)),
              calc(MediaQuery.of(context).size.width * 0.2, "=", Colors.black,
                  39, Color(0XFFFF2A33C)),
            ],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
