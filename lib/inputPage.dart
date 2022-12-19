import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardColor: Color(0xFF1D1E33),
                      cardChild: ReusableIcon(icon: FontAwesomeIcons.mars,
                      text: "MALE",)
                ),),
                Expanded(
                    child: ReusableCard(

                  cardColor: Color(0xFF1D1E33),
                        cardChild: ReusableIcon(icon: FontAwesomeIcons.venus,
                          text: "FEMALE",)
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardColor: Color(0xFF1D1E33),
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardColor: Color(0xFF1D1E33),
                )),
                Expanded(
                    child: ReusableCard(
                  cardColor: Color(0xFF1D1E33),
                )),
              ],
            )),
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;

  ReusableCard({@required this.cardColor, @required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
    ;
  }
}

class ReusableIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  ReusableIcon({@required this.icon, @required this.text});
  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon,
        size: 80,),
        SizedBox(height: 15,),
        Text(text,style: TextStyle(color: Color(0xFF8D8E98),
            fontSize: 18),),],);
  }
}
