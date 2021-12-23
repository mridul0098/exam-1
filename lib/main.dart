import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double floatvalue = 0;
  var activeCardColor = Colors.red;
  var inActiveCardColor = Color(0xFF272B4E);

  var code1CardColor = Color(0xFF272B4E);

  var code2CardColor = Color(0xFF272B4E);

  void updateColor(int Gender) {
    if (Gender == 1) {
      if (code1CardColor == inActiveCardColor) {
        code1CardColor = activeCardColor;
        code2CardColor = inActiveCardColor;
      } else if (code1CardColor == activeCardColor) {
        code1CardColor = inActiveCardColor;
      }
    }
  }

  void updateColor2(int Gender) {
    if (Gender == 2) {
      if (code2CardColor == inActiveCardColor) {
        code2CardColor = activeCardColor;
        code1CardColor = inActiveCardColor;
      } else if (code2CardColor == activeCardColor)
        code2CardColor = inActiveCardColor;
    }
  }

  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF04040C),
          scaffoldBackgroundColor: Color(0xFF0F1335)),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("exam"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(1);
                        });
                      },
                      child: container(
                        colors: code1CardColor,
                        iconContent: iconcontents(
                            icon: FontAwesomeIcons.code, label: 'code 1'),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor2(2);
                      });
                    },
                    child: container(
                      colors: code2CardColor,
                      iconContent: iconcontents(
                          icon: FontAwesomeIcons.code, label: 'code 2'),
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              "${_currentSliderValue.round().toString()}cm",
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 100,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              // child:,
              width: double.infinity,
              height: 200,
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        floatvalue++;
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    '${floatvalue.round()}',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        floatvalue--;
                      });
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class iconcontents extends StatelessWidget {
  final IconData icon;
  final String label;

  iconcontents({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          '$label',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF)),
        )
      ],
    );
  }
}

class container extends StatelessWidget {
  final Color colors;
  // final Icon iconContent;
  final Widget? iconContent;
  container({required this.colors, this.iconContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors),
      child: iconContent,
    );
  }
}
