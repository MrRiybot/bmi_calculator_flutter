import 'package:flutter/material.dart';
import 'styles.dart';
import 'reusableCard.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String bmiResultText;
  final String bmiInter;
  ResultsPage({@required this.bmiInter, @required this.bmiResult, @required this.bmiResultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(children: [
        Text('Your Result',style: digitStyle,),
        Expanded(
          child: ReusableCard(cardColor: inactiveCardColor, cardChild:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(bmiResultText.toUpperCase(),style: kResultTextStyle,),
            Text(bmiResult,style: kBMITextStyle,),
            Text(bmiInter,style: kBodyTextStyle,)
          ],),),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(

            child: Center(
              child: Text('RE-CALCULATE',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            ),
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            height: bottomContainerHeight.toDouble(),
          ),
        )
      ],),
    );
  }
}
