import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';
import 'package:geocoding/geocoding.dart';

import 'map_page.dart';

class LugaresPage extends StatefulWidget{
  @override
  _MyMapLugaresState createState() => _MyMapLugaresState();
}
class _MyMapLugaresState extends State<LugaresPage>{


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("PONTOS DE COLETA", style: GoogleFonts.bebasNeue(color: Color(0xFFab0535), fontSize: 40)),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: _bodyMaps(),
    );
    
  }
  _bodyMaps(){
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:10.0, right:8.0, left:8.0),
          child: cardSelecao(context, "EMOAR 1", "Arapiraca"),
        ),
        Padding(
          padding: EdgeInsets.only(top:5.0, right:8.0, left:8.0),
          child: cardSelecao(context, "EMOAR 2","Arapiraca"),
        ),
        Padding(
          padding: EdgeInsets.only(top:5.0, right:8.0, left:8.0),
          child: cardSelecao(context, "EMOAR 3","Arapiraca"),
        ),
        Padding(
          padding: EdgeInsets.only(top:5.0, right:8.0, left:8.0),
          child: cardSelecao(context, "EMOAR 4","Arapiraca"),
        ),
      ],
    );
  }
  cardSelecao(context, texto1, rua){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Color(0xFFE52B50),
      child:Container(
        width: 90,
        height: 100,
        child: InkWell(
        //splashColor: Colors.blue.withAlpha(30),
        onTap: () async {
          List<Location> locations = await locationFromAddress(rua);
          double lat = locations[0].latitude;
          double long = locations[0].longitude;
          print("Card tapped");
          //Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Maps(lat: lat, long: long,))
          );
          //OnClickNavigator(context, Maps(lat: lat, long: long,));
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
                //Image.asset(caminho, width: 68, height: 68,),
                ],
              
              ),
            ),
          ],
          
        ),

        
      ),
      ),
          
      
      
    );
  }
}
