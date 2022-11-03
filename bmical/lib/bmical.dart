import 'package:bmical/calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BmiCal extends StatefulWidget {
  const BmiCal({Key? key}) : super(key: key);

  @override
  State<BmiCal> createState() => _BmiCalState();
}

class _BmiCalState extends State<BmiCal> {
  int age = 25;
  int weight = 55;
  double height = 130;
  bool ismalee = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 4, 32),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "bmi calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                    flex: 10,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ismalee = true;
                        });
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                        decoration: BoxDecoration(
                          color: ismalee == true ? Colors.green : Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 50,
                            ),
                            Text("Male")
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 10,
                    child: InkWell(
                      onTap: (() {
                        setState(() {
                          ismalee = false;
                        });
                      }),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                        decoration: BoxDecoration(
                          color: ismalee == false ? Colors.green : Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 50,
                            ),
                            Text("Female"),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),

          /// uporer ongso.................................................................................

          /// majher ongso.................................................................................

          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                Text(
                  "Height",
                ),
                Text(
                  "${height.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 50),
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30,
                        ),
                        overlayColor: Colors.pink,
                        activeTrackColor: Colors.white),
                    child: Slider(
                        min: 90,
                        max: 220,
                        value: height,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        }))
              ]),
            ),
          ),

          /// majher ongso.................................................................................
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                    flex: 10,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("wieght"),
                          Text("$weight",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w800)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (weight > 5) {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.remove,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 10,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("age"),
                          Text("$age",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w800)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (age > 5) {
                                    setState(() {
                                      age--;
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.remove,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),

          /// nicher ongso.................................................................................
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                var cal = Calculator(age: age, height: height, weight: weight);
                bmi = cal.getresult();

///////////////////////////////////////////////////////////////////////
                showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                          title: new Text("BMI RESULT $bmi"),
                          content: Text(bmi > 23
                              ? "Its Not Good"
                              : bmi > 18
                                  ? "You Are Perfect"
                                  : "You are Under Weight"),
                          actions: <Widget>[
                            new FlatButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                },
                                child: new Text("Okay"))
                          ],
                        ));
///////////////////////////////////////////////////////////////////////
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.pink,
                child: Text("Calculator"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  var bmi;
}
