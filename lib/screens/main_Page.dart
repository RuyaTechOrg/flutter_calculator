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
    double screenHeight = MediaQuery.of(context).size.height;
    String _input = '';
    String _output = '';


     void clear_Values() {
          setState(() {
            _input = '';
            _output = '';
          });
      }

    void updateValue(newvalue) {
      if(newvalue == 'C'){
       clear_Values();
      }
      else{
      setState(() {
        _input += newvalue; 
      });
      }
    }


    //Clear screen for new calculations
   

    String _calculate() {
      if(_output.isEmpty || _input.isEmpty){
        return _input;
      }

      _input = _input.replaceAll(" ", '');
      int operator_index = _input.indexOf(new RegExp(r'[+\-*/]'));

      String operator = _input[operator_index];

      String operand1 = _input.substring(0,operator_index);
      String operand2 = _input.substring(operator_index + 1);

      double operand_One = double.parse(operand1);
      double operand_Two = double.parse(operand2);

      
      double result;

      switch(operator){
        case "+":
          result = operand_One + operand_Two;
          break;
        case "-":
          result = operand_One - operand_Two;
          break;
        case "/":
          if(operand2 != 0){
             result = operand_One / operand_Two;
          }
          else{
          return 'Error';
          }
        break;
        case "*":
          result = operand_One * operand_Two;
        break;
      default:
        return "Error";
      }
      return result.toString();
    }

//handle buttonRow ( make dry):
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
              if(text == '='){
                setState(() {
                   _output = _calculate();
                });
              }
              else {
              updateValue(text);
              }
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
        const SizedBox(height: 20.0,),
         Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(_input,style: customTextStyle),
          const SizedBox(width: 10.0,),
        ],
      ),
      const SizedBox(height: 10.0,),  
       Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        const SizedBox(width: 10.0,),
        Text(_output,style: answerStyle,)
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
        const SizedBox(height: 20.0,),
          Row(children: [
        buildButtonRow(["7","8","9","*"])
        ],),
          const SizedBox(height: 20.0,),
          Row(children: [
          buildButtonRow(["4","5","6","-"])
        ],),
        const SizedBox(height: 20.0,),
          Row(children: [
        buildButtonRow(["1","2","3","+"])
        ],),
          const SizedBox(height: 20.0,),
          Row(children: [
        buildButtonRow(["0",".","+/-","="])
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
