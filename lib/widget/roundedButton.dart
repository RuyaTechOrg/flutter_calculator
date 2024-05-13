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
    // double screenWidth =  MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return
    Expanded(
    flex: 1,  
    child: 
     ElevatedButton( 
       style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        padding:  EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenHeight * 0.02),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      onPressed: onPressed, child: Text(text,style: const TextStyle(fontSize: 24.0,color: Colors.white,fontWeight: FontWeight.w500,),)),);
  }
}