import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

   const RoundedButton({
    required this.text,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double verticalMeasurements = MediaQuery.of(context).size.width * 0.05;
    double horizontalMeasurements = MediaQuery.of(context).size.width * 0.07;
    return
     ElevatedButton( 
       style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding:  EdgeInsets.symmetric(vertical: verticalMeasurements, horizontal: horizontalMeasurements),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      onPressed: onPressed, child: Text(text,style: const TextStyle(fontSize: 24.0,color: Colors.purple,fontWeight: FontWeight.w500),));
  }
}