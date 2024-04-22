import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BmiApplication extends StatefulWidget {
  BmiApplication({super.key});

  @override
  State<BmiApplication> createState() => _BmiApplicationState();
}

class _BmiApplicationState extends State<BmiApplication> {
  var in_controller = TextEditingController();
  var ft_controller = TextEditingController();
  var wt_controller = TextEditingController();
  var result = "";
  var result_value = "";
  var suggestion = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 233, 226, 226).withOpacity(0.9),
          body: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI CALCULATOR",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 100,
                    width: 450,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white38,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "WEIGHT(KG)",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          controller: wt_controller,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: 140,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white38,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "HEIGHT(FT)",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextField(
                              controller: ft_controller,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 90,
                        width: 140,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white38,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "HEIGHT(INCH)",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextField(
                              controller: in_controller,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          var wt = wt_controller.text.toString();
                          var ft = ft_controller.text.toString();
                          var inch = in_controller.text.toString();

                          if (wt != "" && ft != "" && inch != "") {
                            var int_wt = int.parse(wt);
                            var int_ft = int.parse(ft);
                            var int_inch = int.parse(inch);

                            var tInch = (int_ft * 12) + int_inch;
                            var tCm = tInch * 2.4;
                            var tM = tCm / 100;
                            var bmi = int_wt / (tM * tM);
                            setState(() {
                              result = "YOUR BMI IS:";
                              result_value = "${bmi.toStringAsFixed(2)}";
                            });

                            if (bmi > 18 && bmi < 25) {
                              setState(() {
                                suggestion = "YOU ARE HEALTHY";
                              });
                            } else {
                              setState(() {
                                suggestion = "YOU ARE NOT HEALTHY";
                              });
                            }
                          } else {
                            setState(() {
                              result = "PLEASE FILL ALL THE REQUIRED FIELD";
                            });
                          }
                        },
                        child: Text("CALCULATE BMI")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      result,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      result_value,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      suggestion,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
