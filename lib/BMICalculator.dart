import 'dart:ffi';
import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.height, this.weight});

  final double height;
  final double weight;
  double CalculateBMI(){
    double bmi = weight / pow(height/100,2);
    return bmi;
  }

  String getResult(){
    if(CalculateBMI() >= 25){
      return 'Overweight';
    } else if(CalculateBMI() >18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInter(){
    if(CalculateBMI() >= 25){
      return 'You have a high bmi so try to exercise more and eat less';
    } else if(CalculateBMI() >18.5){
      return 'you have a normal bmi , good job!';
    }
    else{
      return 'you have a low bmi, try to eat more you ugly skinny';
    }
  }
}