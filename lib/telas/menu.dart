import 'package:flutter/material.dart';
import 'package:projetotarsisio/telas/cadastro.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';
import 'package:projetotarsisio/telas/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(home: Menu(),debugShowCheckedModeBanner: false,));

class Menu extends StatelessWidget{
   Widget build(BuildContext context){
    return _telaCadatro(context);
  }
}

_telaCadatro(context){
  return Scaffold(
    appBar: AppBar(
      title: Text("HOME", style: GoogleFonts.bebasNeue(color: Color(0xFFab0535), fontSize: 40),),
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
        child: cardSelecao(context, Color(0xFFab0535), "INFORMAÇÕES"),
      ),
      Padding(
        padding: EdgeInsets.only(top:5.0, right:15.0, left:15.0),
        child: cardSelecao(context, Color(0xFFc40233), "NOTÍCIAS"),
      ),
      Padding(
        padding: EdgeInsets.only(top:5.0, right:15.0, left:15.0),
        child: cardSelecao(context, Color(0xFFE52B50), "LOCALIZAÇÃO"),
      ),
      Padding(
        padding: EdgeInsets.only(top:5.0, right:15.0, left:15.0),
        child: cardSelecao(context, Color(0xFFE32636), "CARTEIRINHA"),
      ),
      Padding(
        padding: EdgeInsets.only(top:5.0, right:15.0, left:15.0),
        child: cardSelecao(context, Color(0xFF8B0000), "PET"),
      ),
      //cardSelecao(context),
      
    ],
  );
}

Card cardSelecao(context, cor, texto1) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: cor,
      child:Container(
        child: InkWell(
        //splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print("Card tapped");
          Navigator.pop(context);
          OnClickNavigator(context, Menu(),);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              SizedBox( height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Container(
                  child: Text(texto1, style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 40),),
                  height: 100,  
                ),
              ],
              
            ),
            
          ],
          
        ),

        
      ),
      ),
          
      
      
    );
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
