import  'package:flutter/material.dart';
import 'package:project_1/widget/roundedButton.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    double buttonSpace = MediaQuery.of(context).size.width * 0.047;
    return  Scaffold(
    backgroundColor: const Color(0xFF151715),
    body: Column(children: [
      Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width:0.3,color: Colors.grey))),  
      child:
      const Column(
        children: [
        SizedBox(height: 20.0,),
         Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("1",style: customTextStyle),
          SizedBox(width: 10.0,),
          Text('+',style: secondNumStyle),
          SizedBox(width: 10.0,),
          Text("32",style: customTextStyle,),
          SizedBox(width: 10.0,),
          Text("=",style: secondNumStyle),
        ],
      ),
      SizedBox(height: 10.0,),  
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
       
        SizedBox(width: 10.0,),
        Text("33",style: answerStyle,)
      ],)
      ],)),
      Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width * 1.0,  
      child: Column(
        children: [
        Container(
        padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0), 
        child: 
        Row(children: [
        RoundedButton(text: "C",onPressed: () {print("C");},),
        SizedBox(width: buttonSpace),
         RoundedButton(text: "%",onPressed: () {print("This buttnoworks!");},),
           SizedBox(width: buttonSpace),
          RoundedButton(text: "D",onPressed: () {print("This buttnoworks!");},),
            SizedBox(width: buttonSpace),
           RoundedButton(text: "/",onPressed: () {print("This buttnoworks!");},),
             SizedBox(width: buttonSpace),
        ],)
        ,),
        SizedBox(height: 20.0,),
          Row(children: [
        RoundedButton(text: "7",onPressed: () {print("This buttnoworks!");},),
        SizedBox(width: buttonSpace),
         RoundedButton(text: "8",onPressed: () {print("This buttnoworks!");},),
           SizedBox(width: buttonSpace),
          RoundedButton(text: "9",onPressed: () {print("This buttnoworks!");},),
            SizedBox(width: buttonSpace),
           RoundedButton(text: "*",onPressed: () {print("This buttnoworks!");},),
             SizedBox(width: buttonSpace),
        ],),
          SizedBox(height: 20.0,),
          Row(children: [
        RoundedButton(text: "4",onPressed: () {print("This buttnoworks!");},),
        SizedBox(width: buttonSpace),
         RoundedButton(text: "5",onPressed: () {print("This buttnoworks!");},),
           SizedBox(width: buttonSpace),
          RoundedButton(text: "6",onPressed: () {print("This buttnoworks!");},),
            SizedBox(width: buttonSpace),
           RoundedButton(text: "-",onPressed: () {print("This buttnoworks!");},),
             SizedBox(width: buttonSpace),
        ],),
         SizedBox(height: 20.0,),
          Row(children: [
        RoundedButton(text: "1",onPressed: () {print("This buttnoworks!");},),
        SizedBox(width: buttonSpace),
         RoundedButton(text: "2",onPressed: () {print("This buttnoworks!");},),
           SizedBox(width: buttonSpace),
          RoundedButton(text: "3",onPressed: () {print("This buttnoworks!");},),
            SizedBox(width: buttonSpace),
           RoundedButton(text: "+",onPressed: () {print("This buttnoworks!");},),
             SizedBox(width: buttonSpace),
        ],),
          SizedBox(height: 20.0,),
          Row(children: [
        RoundedButton(text: "0",onPressed: () {print("This buttnoworks!");},),
        SizedBox(width: buttonSpace),
          RoundedButton(text: ".",onPressed: () {print("This buttnoworks!");},),
            SizedBox(width: buttonSpace),
          //  RoundedButton(text: "+/-",onPressed: () {print("This buttnoworks!");},),
          //    SizedBox(width: buttonSpace),
              RoundedButton(text: "=",onPressed: () {print("This buttnoworks!");},),
             SizedBox(width: buttonSpace),
        ],),
      ]),)
    ],));
  }
}

const TextStyle customTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 34.0,
  fontWeight: FontWeight.w500
);

const TextStyle secondNumStyle =  TextStyle(
  color: Colors.white,
  fontSize: 34.0,
  fontWeight:  FontWeight.bold
);

const TextStyle answerStyle = TextStyle(
  color: Colors.purple,
  fontSize: 60.0
);
