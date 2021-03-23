import 'package:flutter/material.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';
import 'package:projetotarsisio/telas/menu.dart';
import 'package:google_fonts/google_fonts.dart';
class Cadastro extends StatelessWidget{
   Widget build(BuildContext context){
    return _telaCadatro(context);
  }
}


_telaCadatro(context){
  return Scaffold(
    appBar: AppBar(
      title: Text("CADASTRAR", style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 37),),
      backgroundColor: Color(0xFFab0535),
    ),
    body: _bodyCadastro(context),
  );
}

_bodyCadastro(context){
  return Padding(
    padding: EdgeInsets.only(top: 20.0, left: 30.0,right: 30.0 ),
    child: ListView(
      children: <Widget>[
        _textFormField("Nome"),
        SizedBox(height: 20.0,),
        _textFormField("CPF:"),
        SizedBox(height: 20.0,),
        _textFormField("Email"),
        SizedBox(height: 20.0,),
        _textFormField("Senha"),
        SizedBox(height: 20.0,),
        _textFormField("Confirmar Senha:"),
        SizedBox(height: 30.0,),
        Padding(
          padding: EdgeInsets.only(right: 90.0,left: 90.0),
          child: _buttonsLogin(context, "Cadastrar"),
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
_textFormField(texto){
  return TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            labelText: texto,
            labelStyle: GoogleFonts.montserrat(color: Color(0xFFab0535), fontSize: 18),
            border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFab0535),
            ),
          ),
         ),
        );
}
_onClickNavigator(context, page){
  OnClickNavigator(context, page);
}
