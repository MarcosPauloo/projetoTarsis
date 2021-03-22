import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future OnClickNavigator(context, Widget page, {bool replace = false} ) async {
  if(replace){
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
  else{
     return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
 
}
