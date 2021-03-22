import 'package:flutter/material.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';

void main() => runApp(MaterialApp(home: Cadastro(),debugShowCheckedModeBanner: false,));



class Cadastro extends StatelessWidget{
   Widget build(BuildContext context){
    return _telaCadatro();
  }
}


_telaCadatro(){
  return Scaffold(
    appBar: AppBar(
      title: Text("Cadastro"),
      backgroundColor: Color(0xFFab0535),
    ),
  );
}