import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key,  required this.icon , required this.onPressed}) : super(key: key);

  final IconData icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed ,
      child: Icon(icon),
      elevation: 0.0 ,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor:const Color(0xFF4C4F5E) ,
      shape: const CircleBorder(),

    );
  }
}
