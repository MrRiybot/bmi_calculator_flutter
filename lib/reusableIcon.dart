import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class ReusableIcon extends StatelessWidget {
  final IconData icon;
  final Text text;
  ReusableIcon({@required this.icon, @required this.text});
  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon,
          size: 80,),
          SizedBox(height: 15,),
          text,],);
  }
}
