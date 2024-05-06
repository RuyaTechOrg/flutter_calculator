import 'package:flutter/material.dart';
import 'package:project_1/screens/mainPage.dart';

class OnboardingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Future.delayed(Duration(seconds: 5),() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainPage())
      );
    });
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(child: 
      Text("Calculator",style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),)
      ),
    );
  } 
}