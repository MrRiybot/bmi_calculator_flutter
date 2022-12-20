import 'package:bmi_calculator/BMICalculator.dart';
import 'package:bmi_calculator/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableIcon.dart';
import 'reusableCard.dart';
import 'styles.dart';
import 'BMICalculator.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color femaleCardColor = inactiveCardColor;
  Color maleCardColor = inactiveCardColor;
  void updateColor(bool isMale) {
    if (isMale) {
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColor;
    } else {
      femaleCardColor = activeCardColor;
      maleCardColor = inactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(true);
                      });
                    },
                    child: ReusableCard(
                        cardColor: maleCardColor,
                        cardChild: ReusableIcon(
                          icon: FontAwesomeIcons.mars,
                          text: Text(
                            "MALE",
                            style: labelStyle,
                          ),
                        )),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(false);
                    });
                  },
                  child: ReusableCard(
                      cardColor: femaleCardColor,
                      cardChild: ReusableIcon(
                          icon: FontAwesomeIcons.venus,
                          text: Text(
                            "MALE",
                            style: labelStyle,
                          ))),
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  child: ReusableCard(
                    cardColor: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: labelStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: digitStyle,
                            ),
                            Text(
                              "cm",
                              style: labelStyle,
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          inactiveColor: Color(0xFF8D8E98),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardColor: inactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: digitStyle,
                          ),
                          Text("kg")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                            backgroundColor: Color(0xFF4C4F5E),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                            backgroundColor: Color(0xFF4C4F5E),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  cardColor: inactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: labelStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            age.toString(),
                            style: digitStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                            backgroundColor: Color(0xFF4C4F5E),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                            backgroundColor: Color(0xFF4C4F5E),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculatorBrain cal =
                    CalculatorBrain(height: height.toDouble(), weight: weight.toDouble());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiInter: cal.getInter(),
                      bmiResult: cal.CalculateBMI().toStringAsFixed(1),
                      bmiResultText: cal.getResult(),
                    ),
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: bottomContainerColor,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: bottomContainerHeight.toDouble(),
              ),
            )
          ],
        ));
  }
}
