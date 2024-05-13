import  'package:flutter/material.dart';
import 'package:project_1/screens/scientific_calc.dart';
import 'package:project_1/widget/roundedButton.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
    String _input = '0';
    String _output = '';

  @override
  Widget build(BuildContext context) {
    double buttonSpace = MediaQuery.of(context).size.width * 0.047;
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    // double scaffoldPadding = MediaQuery.of(context).size.width * 0.01;
    double _sci_btn = MediaQuery.of(context).size.width * 0.7;


     void clear_Values() {
          setState(() {
            _input = '0';
            _output = '';
          });
      }

     

    void updateValue(newvalue) {

       void refresh_add() {
             setState(() {
             if(_input == '0'){
            _input = '';
            _input += newvalue;  
            }
            else{
            _input += newvalue;
             }
            print(_input);
            });
      }
      if(newvalue == 'C'){
       clear_Values();
      }
      else if(newvalue == 'D'){
        setState(() {
          if(_input.isNotEmpty){
            _input = _input.substring(0, _input.length - 1);
          }
          //remove last value added.
        });
      }
      else if(newvalue == '%'){
          setState(() {
            if(_input.isEmpty || _input == '0'){
              null;
            }
            else{
           refresh_add();
            }
          });
      }
      else{
        refresh_add();
      }
    }
    //Clear screen for new calculations
    String _calculate() {
      _input = _input.replaceAll(" ", '');
      int operator_index = _input.indexOf(new RegExp(r'[+\-*/]'));
      print(operator_index);

        if(_input == '' ||operator_index == -1){
        return _input;
      }

      String operator = _input[operator_index];

      String operand1 = _input.substring(0,operator_index);
      String operand2 = _input.substring(operator_index + 1);

      List<String> operands = _input.split(RegExp(r'[-+*/]'));
      List<String> operators = _input.split(RegExp(r'\d+')).where((element) => element.isNotEmpty).toList();

      double operand_One = double.parse(operand1);
      double operand_Two = double.parse(operand1);
    // print(operands);
    // print(operators);


      

      double result = double.parse(operands[0]);


      for (int  i = 0; i < operators.length;i++){
      String operator = operators[i];
      double operand = double.parse(operands[i + 1]);

        switch(operator){
        case "+":
          result += operand;
          break;
        case "-":
          result -= operand;
          break;
        case "/":
          if(operand != 0){
             result /= operand;
          }
          else{
          return "Error";
          }
        break;
        case "*":
          result *= operand;
        break;
      default:
        return "Error";
      }
      }
      print(result);
      return result.toString();
      // return "works";
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
    backgroundColor: Color.fromARGB(255, 82, 25, 92),
    body: Column(children: [
      Container(
      padding: const EdgeInsets.fromLTRB(0.0,20.0, 20.0, 0.0),
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width:0.3,color: Colors.grey))),  
      child:
       Column(
        children: [
        const SizedBox(height: 10.0,),
         Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          width: _sci_btn,
          decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(50.0)),  
          child: 
          ElevatedButton(  
          style: const ButtonStyle(backgroundColor : MaterialStatePropertyAll(Color.fromARGB(255, 37, 9, 42))),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const ScientificCalc())));
          }, child: const Text("Scientific Calculator",style: TextStyle(color: Colors.purple),)),),
          const SizedBox(height:10.0,),
         ],
      ),
      Expanded(
      flex: 2,  
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),  
        child: 
        Text(_input,style: customTextStyle,)
        ,)
      ],)),
      const SizedBox(height: 5.0,),  
      Expanded(
      flex: 1,  
      child: 
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const SizedBox(width: 3.0,),  
        Text('Ans: $_output',style: answerStyle,)
      ],)
      )
      ],)),
      Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      height: MediaQuery.of(context).size.height * 0.65,
      width: screenWidth,  
      child: Column(
        children: [
        Expanded(
        flex: 1,
        child:  
        Container(
        width: screenWidth,
        padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0), 
        child: 
        Row(children: [
        buildButtonRow(["C","%","D","/"]),
        ],))
        ,),
        const SizedBox(height: 20.0,),
        Expanded(
        flex: 1,  
        child:   
        Row(children: [
        buildButtonRow(["7","8","9","*"])
        ],)),
          const SizedBox(height: 20.0,),
        Expanded(
        flex: 1,
        child:   
        Row(children: [
          buildButtonRow(["4","5","6","-"])
        ],)),
        const SizedBox(height: 20.0,),
         Expanded(
          flex: 1,
          child: 
          Row(children: [
        buildButtonRow(["1","2","3","+"])
        ],),),
          const SizedBox(height: 20.0,),
          Expanded(
          flex: 1,  
          child: 
          Row(children: [
        buildButtonRow(["0",".","+/-","="])
        ],)),
      ]),)
    ],));
  }
}


const TextStyle customTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24.0,
  fontWeight: FontWeight.w500
);

const TextStyle secondNumStyle =  TextStyle(
  color: Colors.white,
  fontSize: 24.0,
  fontWeight:  FontWeight.bold
);

const TextStyle answerStyle = TextStyle(
  color: Colors.purple,
  fontSize: 24.0
);
