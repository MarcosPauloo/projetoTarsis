import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projetotarsisio/telas/cadastro.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';
import 'package:projetotarsisio/telas/login.dart';
import 'package:projetotarsisio/telas/infopag.dart';
import 'package:google_fonts/google_fonts.dart';

class Noticias extends StatelessWidget{
   Widget build(BuildContext context){
    return _telaNoticias(context);
  }
}

_telaNoticias(context){
  return Scaffold(
    appBar: AppBar(
      title: Text("NOTÍCIAS", style: GoogleFonts.bebasNeue(color: Color(0xFFab0535), fontSize: 40),),
      backgroundColor: Color(0xFFFFFFFF),
    ),
    body: _bodyHome(context),
  );
}

_bodyHome(context){
  return Container(
    color: Color(0xFFD3D3D3),
    child: Center(
      child: _cards(context),
    ),
  );
  
}
_cards(context){
  return ListView(
    
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top:20.0, right:15.0, left:15.0),
        child: cardNoticia(context, "Conheça Arma Bruxa, a fusão entre X-23 e Feiticeira Escarlate", "Arma Bruxa ou 'Weapon Hex', é uma amálgama entre Feiticeira Escarlate e X-23... "),
      ),
      Padding(
        padding: EdgeInsets.only(top:20.0, right:15.0, left:15.0),
        child: cardNoticia(context, "Conheça Arma Bruxa, a fusão entre X-23 e Feiticeira Escarlate", "Arma Bruxa ou 'Weapon Hex', é uma amálgama entre Feiticeira Escarlate e X-23... "),
      ),
      Padding(
        padding: EdgeInsets.only(top:20.0, right:15.0, left:15.0),
        child: cardNoticia(context, "Conheça Arma Bruxa, a fusão entre X-23 e Feiticeira Escarlate", "Arma Bruxa ou 'Weapon Hex', é uma amálgama entre Feiticeira Escarlate e X-23... "),
      ),
      
      
    ],
  );
}

Card cardNoticia(context, titulo, conteudo) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _tituloNocitcia(titulo),
          _conteudoNoticia(conteudo),
          Container(
          height: 20,
          alignment: Alignment.centerRight,
          child: FlatButton(
            child: Text(
              "Continuar lendo",
              textAlign: TextAlign.right ,
              style: GoogleFonts.montserrat(color: Color(0xFFab0535), fontSize: 18),
            ),
           onPressed: null,
           
          )
        ),
        ],
      ),
      ),
    );
}
_tituloNocitcia(titulo){
  return Text(titulo, style: GoogleFonts.montserrat(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold));
}
_conteudoNoticia(conteudo){
  return Text(conteudo, style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18));
}
_buttonsLogin(context, texto){
    return RaisedButton(
      child: Text(texto, style: TextStyle(color: Color(0xFFD3D3D3), fontSize: 18 ,),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(width: 3.0,color: Color(0xFFab0535)),
        ),
      color: Color(0xFFab0535),
      onPressed: ()=> _onClickNavigator(context, Cadastro()),
    );
}

_onClickNavigator(context, page){
  OnClickNavigator(context, page);
}
