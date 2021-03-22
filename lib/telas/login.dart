import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetotarsisio/telas/cadastro.dart';
import 'package:projetotarsisio/telas/menu.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';

void main() => runApp(MaterialApp(home: Login(),debugShowCheckedModeBanner: false,));

class Login extends StatelessWidget{
   Widget build(BuildContext context){
    return _telaCadatro(context);
  }
}

_telaCadatro(context){
  return Scaffold(
    appBar: AppBar(
      title: Text("LOGIN", style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 37),),
      backgroundColor: Color(0xFFab0535),
    ),
    body: _bodyLogin(context),
  );
}

_bodyLogin(context){
  return Padding(
    padding: EdgeInsets.only(top: 20.0, left: 30.0,right: 30.0 ),
    child: ListView(
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            labelText: "Login",
            labelStyle: GoogleFonts.montserrat(color: Color(0xFFab0535), fontSize: 20),
            border: OutlineInputBorder(
              
              borderSide: BorderSide(
                color: Color(0xFFab0535),
                width: 3.0,
              ),
            
          ),
          ),
        ),
        SizedBox(height: 20.0,),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: GoogleFonts.montserrat(color: Color(0xFFab0535), fontSize: 20),
            
            border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFab0535),
            ),
          ),
         ),
        ),
        Container(
          height: 40,
          alignment: Alignment.centerRight,
          child: FlatButton(
            child: Text(
              "Recuperar Senha",
              textAlign: TextAlign.right ,
              style: GoogleFonts.montserrat(color: Color(0xFFab0535), fontSize: 15),
            ),
           onPressed: null,
           
          )
        ),
        //Text("this google fonts", style: GoogleFonts.bebasNeue(fontSize: 20),),
        Padding(
          padding: EdgeInsets.only(right: 90.0,left: 90.0),
          child: _buttonsLogin(context, "Login"),
        ),
        
      ],
    ),
  ); 
}
_buttonsLogin(context, texto){
    return RaisedButton(
      child: Text(texto, style: GoogleFonts.bebasNeue(color:Color(0xFFFFFFFF), fontSize: 24),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(width: 3.0,color: Color(0xFFab0535)),
        ),
      color: Color(0xFFab0535),
      onPressed: ()=> _onClickNavigator(context, Menu()),
    );
}

_onClickNavigator(context, page){
  OnClickNavigator(context, page);
}
