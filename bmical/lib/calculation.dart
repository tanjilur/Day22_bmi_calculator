import 'dart:math';

class Calculator {
  int? age, weight;
  double? height;

  Calculator({this.age, this.height, this.weight});

  getresult() {
    final bmi = weight! / pow(height! / 100, 2);
    print("$bmi");
    return bmi;
  }
}
