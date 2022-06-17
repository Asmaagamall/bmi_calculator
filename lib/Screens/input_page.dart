import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icon_content.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';
import '../Components/bottom_button.dart';
import '../Components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? genderSelected;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    colour: genderSelected == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    colour: genderSelected == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget> [
                  const Text('HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                      height.toString(),
                      style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(data: SliderTheme.of(context).copyWith(
                    thumbColor: const Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor:const Color(0xFF8D8E89),
                    overlayColor: const Color(0x29EB1555),
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                    child: Slider(
                        value: height.toDouble() ,
                        min: 120.0,
                        max: 220.0,
                        onChanged: (newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                              setState(() {
                                weight--;
                              });
                              },
                            ),
                            const SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                              setState(() {
                                weight++;
                              });
                              },
                            ),
                          ],
                          
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',style: kLabelTextStyle,),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),

                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CALCULATE',
          onTap: (){
            CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
            Navigator.push(context, MaterialPageRoute(builder:(context) => ResultsPage(
              bmiResult:calc.calculateBMI() ,
              resultText: calc.getResult(),
              interpretation:calc.getInterpretation() ,
            )));
          },
          ),
        ],
      ),
    );
  }
}

