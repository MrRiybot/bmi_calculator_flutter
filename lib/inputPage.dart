import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableIcon.dart';
import 'reusableCard.dart';

const bottomContainerHeight = 80;
const activeCardColor = Color(0xFF111328);
const inactiveCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);
const labelStyle = TextStyle(color: Color(0xFF8D8E98), fontSize: 18);
const digitStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
int height = 180;
int weight = 80;
int age = 18;
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
                          FloatingActionButton(onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                            child: Icon(FontAwesomeIcons.minus,color: Colors.white),
                            backgroundColor: Color(0xFF4C4F5E),),
                          SizedBox(width: 10,),
                        FloatingActionButton(onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },
                        child: Icon(FontAwesomeIcons.plus,color: Colors.white),
                        backgroundColor: Color(0xFF4C4F5E),),

                      ],)
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
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                                child: Icon(FontAwesomeIcons.minus,color: Colors.white),
                                backgroundColor: Color(0xFF4C4F5E),),
                              SizedBox(width: 10,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                                child: Icon(FontAwesomeIcons.plus,color: Colors.white),
                                backgroundColor: Color(0xFF4C4F5E),),

                            ],)
                        ],
                      ),
                )),
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight.toDouble(),
            )
          ],
        ));
  }
}
