import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetotarsisio/telas/cadastro.dart';
import 'package:projetotarsisio/telas/menu.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';
import 'package:validadores/validadores.dart';
class Login extends StatelessWidget{

  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();
  final _tPassword = TextEditingController();

   Widget build(BuildContext context){
    return _telaCadatro(context);
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
      child: Form(
        key: _formKey,
        child: Container(
          child: formLogin(context),
        ),
      ),
    ); 
  }

  formLogin(context){
    return ListView(
        children: <Widget>[
          _textFormFieldLogin("Login", _tLogin, _validateLogin),
          SizedBox(height: 20.0,),
          _textFormFieldLogin("Senha", _tPassword, _validateSenha, password: true),
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
      );
  }
  _textFormFieldLogin(texto, TextEditingController controller, FormFieldValidator<String> validator, {bool password = false} ){
    return TextFormField(
            validator: validator,
            controller: controller,
            obscureText: password,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: texto,
              labelStyle: GoogleFonts.montserrat(color: Color(0xFFab0535), fontSize: 20),
              border: OutlineInputBorder(
                
                borderSide: BorderSide(
                  color: Color(0xFFab0535),
                  width: 3.0,
          ),
              
        ),
      ),
    );
  }
  String _validateLogin(String text){
    if(text.isEmpty){
      return "Digite o Login";
    }
    return null;
  }
  String _validateSenha(String text){
    if(text.isEmpty){
      return "Digite a senha";
    }
    if(text.length<8){
      return "A senha precisa ter no mínimo 8 caracteres";
    }
    return null;
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
    String login = _tLogin.text;
    String senha = _tPassword.text;

    bool _formOK = _formKey.currentState.validate();
    if(!_formOK){
      return;
    }

    //print("Login: $login, Senha: $senha");
    OnClickNavigator(context, page);
  }






}

