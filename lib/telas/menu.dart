import 'package:flutter/material.dart';
import 'package:projetotarsisio/classes/endereco.dart';
import 'package:projetotarsisio/classes/enderecoAPI.dart';
import 'package:projetotarsisio/classes/user.dart';
import 'package:projetotarsisio/classes/userDao.dart';
import 'package:projetotarsisio/telas/cadastro.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';
import 'package:projetotarsisio/telas/login.dart';
import 'package:projetotarsisio/telas/infopag.dart';
import 'package:projetotarsisio/telas/noticias.dart';
import 'package:google_fonts/google_fonts.dart';

import 'listaLugares.dart';
import 'map_page.dart';


class Menu extends StatefulWidget{
  @override
  _TelaMenuState createState() => _TelaMenuState();
}

class _TelaMenuState extends State<Menu>{
  Future<List<User>> listaUsuarios;
  

  @override
  void initState() {
    super.initState();
    listaUsuarios = UserDao().carregarUsuarios(); //parte de banco de dados
   
    
    
  }

  @override
  Widget build(BuildContext context){
    return _telaMenu(context);
  }

  _telaMenu(context){
    
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
        child: cardSelecao(context, Color(0xFFab0535), "INFORMAÇÕES", "images/list.png", Info(),),
      ),
      Padding(
        padding: EdgeInsets.only(top:5.0, right:15.0, left:15.0),
        child: cardSelecao(context, Color(0xFFc40233), "NOTÍCIAS", "images/journal.png", Noticias(),),
      ),
      Padding(
        padding: EdgeInsets.only(top:5.0, right:15.0, left:15.0),
        child: cardSelecao(context, Color(0xFFE52B50), "LOCALIZAÇÃO", "images/location.png", LugaresPage(),),
      ),
      Padding(
        padding: EdgeInsets.only(top:5.0, right:15.0, left:15.0),
        child: cardSelecao(context, Color(0xFFE32636), "CARTEIRINHA", "images/card.png", Info(),),
      ),
      Padding(
        padding: EdgeInsets.only(top:5.0, right:15.0, left:15.0),
        child: cardSelecao(context, Color(0xFF8B0000), "PET", "images/dog.png", Info(),),
      ),
      //cardSelecao(context),
      
    ],
  );
}

Card cardSelecao(context, cor, texto1, caminho, page){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: cor,
      child:Container(
        width: 90,
        height: 100,
        child: InkWell(
        //splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          
          print("Card tapped");
          //Navigator.pop(context);
          OnClickNavigator(context, page);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 12, left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: <Widget>[
                Text(texto1, style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 40),),                
                Spacer(),
                Image.asset(caminho, width: 68, height: 68,),
                ],
              
              ),
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

  _resgatarCEP()async{
      String cep = "01001-000";
      Endereco end = await EnderecoApi().procurarCEP(cep); 
      print(end.cep);     
  }
}


