import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final int age;
  final int weight;
  final double height;
  final bool isMale;
  final double result;

  BmiResult({
    Key? key,
    required this.age,
    required this.weight,
    required this.height,
    required this.isMale,
    required this.result,
  }) : super(key: key);

  String calculateWeightCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    String description = calculateWeightCategory(result);

    return Scaffold(
      appBar: AppBar(
        title: Text('Back', style: TextStyle(fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Result',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  'Your BMI is',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 147, 192, 226),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${result.toStringAsFixed(1)}',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Kg/m²',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  '($description)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image(
                          image: AssetImage(
                            isMale
                                ? 'assets/images/man.png'
                                : 'assets/images/women.png',
                          ),
                          height: 60,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${isMale ? 'Male' : 'Female'}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '$age',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Height (CM)',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${height.toStringAsFixed(0)}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '$weight',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (result < 18.5) // Display for BMI less than 18.5
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'A BMI of ',
                            ),
                            TextSpan(
                              text: 'less than 18.5',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text: ' indicates that your weight is in the ',
                            ),
                            TextSpan(
                              text: 'Underweight',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text:
                                  ' category for a person of your height.\n\nMaintaining a healthy weight reduces the risk of diseases associated with overweight and obesity.',
                            ),
                          ],
                        ),
                      ),
                    if (result >= 18.5 &&
                        result < 25) // Display for BMI between 18.5 and 24.9
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'A BMI of ',
                            ),
                            TextSpan(
                              text: '18.5-24.9',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text: ' indicates that your weight is in the ',
                            ),
                            TextSpan(
                              text: 'normal',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text:
                                  ' category for a person of your height.\n\nMaintaining a healthy weight reduces the risk of diseases associated with overweight and obesity.',
                            ),
                          ],
                        ),
                      ),
                    if (result >= 25 &&
                        result < 30) // Display for BMI between 25 and 29.9
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'A BMI of ',
                            ),
                            TextSpan(
                              text: '25-29.9',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text: ' indicates that your weight is in the ',
                            ),
                            TextSpan(
                              text: 'Overweight',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text:
                                  ' category for a person of your height.\n\nMaintaining a healthy weight reduces the risk of diseases associated with overweight and obesity.',
                            ),
                          ],
                        ),
                      ),
                    if (result >= 30) // Display for BMI 30 or greater
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'A BMI of ',
                            ),
                            TextSpan(
                              text: '30 or greater',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text: ' indicates that your weight is in the ',
                            ),
                            TextSpan(
                              text: 'Obese',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text:
                                  ' category for a person of your height.\n\nMaintaining a healthy weight reduces the risk of diseases associated with overweight and obesity.',
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 147, 192, 226),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'TRY AGAIN',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.refresh,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
