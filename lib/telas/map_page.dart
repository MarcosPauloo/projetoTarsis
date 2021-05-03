import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget{
  double lat;
  double long;

  Maps({this.lat, this.long});
  @override
  _MyMapPageState createState() => _MyMapPageState();
}
class _MyMapPageState extends State<Maps>{
  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _initialLocation;

  @override
  void _initState(){
    super.initState();
    _initialLocation = CameraPosition(zoom: 13, target: LatLng(widget.lat, widget.long));
  }
  /*static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(-9.75164,  -36.6604),
      zoom: 17,
    );*/

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
    return Container(
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _initialLocation,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
      ),
  );
  }
}
