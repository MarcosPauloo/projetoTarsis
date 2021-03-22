

import 'package:flutter/material.dart';
import 'package:projetotarsisio/telas/cadastro.dart';
import 'package:projetotarsisio/telas/login.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';

void main() => runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  Widget build(BuildContext context){
    return _inicialApp(context);
  }
}

_inicialApp(context){
  return Stack(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/tela1.png'),
          fit: BoxFit.cover),
        ), 
      ),
      Column(children: <Widget>[
        SizedBox(height: 70.0,),
        Row(
          children: <Widget>[
            _buttonsInicio(context,"Login", Login()),
            SizedBox(width: 25, height: 10,),
            _buttonsInicio(context, "Cadastro", Cadastro()),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      ),
      
     
    ],
  );

  
}
_buttonsInicio(context, texto, Widget page){
    return RaisedButton(
      child: Text(texto, style: TextStyle(color: Color(0xFFAB0535),),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(width: 3.0,color: Color(0xFFD3D3D3)),
        ),
      color: Color(0xFFFFFFFF),
      onPressed: ()=> _onClickNavigator(context, page),
    );
}
_onClickNavigator(context, page){
  OnClickNavigator(context, page);
}


