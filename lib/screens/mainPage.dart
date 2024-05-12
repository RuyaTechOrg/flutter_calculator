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
    double screenWidth = MediaQuery.of(context).size.width;


  Widget buildButtonRow(List<String> texts) {
  return 
  Expanded(child: 
  Row(
    children: texts.map((text) => 
          Expanded(child: 
          Row(children: [
          RoundedButton(
            text: text,
            onPressed: () {
              print("Button $text Pressed");
            },
    ),SizedBox(width: buttonSpace,)],)),).toList(),
  ));
}



    return  Scaffold(
    backgroundColor: const Color(0xFF151715),
    body: Column(children: [
      Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width:0.3,color: Colors.grey))),  
      child:
       Column(
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
      width: screenWidth,  
      child: Column(
        children: [
        Container(
        width: screenWidth,
        padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0), 
        child: 
        Row(children: [
        buildButtonRow(["C","%","D","/"]),
        ],)
        ,),
        SizedBox(height: 20.0,),
          Row(children: [
        buildButtonRow(["7","8","9","*"])
        ],),
          SizedBox(height: 20.0,),
          Row(children: [
          buildButtonRow(["4","5","6","-"])
        ],),
         SizedBox(height: 20.0,),
          Row(children: [
        buildButtonRow(["1","2","3","+"])
        ],),
          SizedBox(height: 20.0,),
          Row(children: [
        buildButtonRow(["0",".","+/-","="])
        ],),
      ]),)
    ],));
  }
}


//handle buttonRow ( make dry):



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
