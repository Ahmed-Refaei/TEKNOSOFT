import 'dart:math';
import 'package:flutter/material.dart';
import 'result.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double hightVal = 170;
  int weihgt = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'male'),
                    const SizedBox(width: 15),
                    m1Expanded(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 213, 217, 221),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',
                          style: Theme.of(context).textTheme.displayMedium),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(hightVal.toStringAsFixed(0),
                              style: Theme.of(context).textTheme.displayLarge),
                          Text('cm',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 220,
                        value: hightVal,
                        onChanged: (newValue) =>
                            setState(() => hightVal = newValue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'weight'),
                    const SizedBox(width: 15),
                    m2Expanded(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  double result = weihgt / pow(hightVal / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiResult(
                        age: age,
                        weight: weihgt,
                        height: hightVal,
                        isMale: isMale,
                        result: result,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 147, 192, 226),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CALCULATE BMI',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.calculate, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMale = type == 'male' ? true : false),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Color.fromARGB(255, 147, 192, 226)
                : Colors.grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                type == 'male'
                    ? 'assets/images/man.png'
                    : 'assets/images/women.png',
                width: 90,
                height: 90,
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  type == 'male' ? 'Male' : 'Female',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
        child: Container(
      child: GestureDetector(
        onTap: () => setState(() => isMale = type == 'male' ? true : false),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 213, 217, 221),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type == 'age' ? 'Age' : 'Weight',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'age' ? '$age' : '$weihgt',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: type == 'age' ? 'age--' : 'weight--',
                    onPressed: () =>
                        setState(() => type == 'age' ? age-- : weihgt--),
                    child: const Icon(Icons.remove),
                    mini: true,
                  ),
                  const SizedBox(width: 10),
                  FloatingActionButton(
                    heroTag: type == 'age' ? 'age++' : 'weight++',
                    onPressed: () =>
                        setState(() => type == 'age' ? age++ : weihgt++),
                    child: const Icon(Icons.add),
                    mini: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
