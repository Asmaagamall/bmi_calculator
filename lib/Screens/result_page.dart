import 'package:bmi_calculator/Components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
   const ResultsPage({Key? key, required this.bmiResult , required this.resultText , required this.interpretation}) : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('BMI CALCULATOR'),
      ),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
        Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.bottomLeft,
          child: const Text('Your Results'
          ,style: kTitleTextStyle,),
        ),
          Expanded(
            child: ReusableCard(
              onPress: (){},
              colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextTitle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
    BottomButton(onTap: (){
      Navigator.pop(context);
    }, buttonTitle: 'RE-CALCULATE')
    ]
      ),

    );
  }
}
