import 'package:flutter/material.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';
import 'package:projetotarsisio/telas/menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validadores/validadores.dart';
class Cadastro extends StatelessWidget{
  
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();
  final _tNome = TextEditingController();
  final _tCPF = TextEditingController();
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();
  final _tConfirmPassword = TextEditingController();
  
  Widget build(BuildContext context){
    return _telaCadatro(context);
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
      child: Form(
        key: _formKey,
        child: Container(
          child: _listViewCadastro(context),
        ),
      ),
    ); 
  }
  _listViewCadastro(context){
    return ListView(
        children: <Widget>[
          _textFormField("Login", _validateLogin, _tLogin),
          SizedBox(height: 20.0,),
          _textFormField("Nome", _validateName, _tNome),
          SizedBox(height: 20.0,),
          _textFormField("CPF:", _validateCPF, _tCPF),
          SizedBox(height: 20.0,),
          _textFormField("Email", _validateEmail, _tEmail),
          SizedBox(height: 20.0,),
          _textFormField("Senha", _validateSenha, _tPassword, password: true),
          SizedBox(height: 20.0,),
          _textFormField("Confirmar Senha:", _validateConfirmaSenha, _tConfirmPassword, password: true),
          SizedBox(height: 30.0,),
          Padding(
            padding: EdgeInsets.only(right: 90.0,left: 90.0),
            child: _buttonsLogin(context, "Cadastrar"),
          ),
        
        ],
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
  _textFormField(texto, FormFieldValidator<String> validator, TextEditingController controller, {bool password = false} ){
    return TextFormField(
            validator: validator,
            controller: controller,
            keyboardType: TextInputType.text,
            obscureText: password,
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
    String login = _tLogin.text;
    String nome = _tNome.text;
    String cpf = _tCPF.text;
    String email = _tEmail.text;
    String senha = _tPassword.text;
    String confirmarSenha = _tConfirmPassword.text;


    bool _formOK = _formKey.currentState.validate();
     if(!_formOK){
      return;
    }

    OnClickNavigator(context, page);
  }
  String _validateLogin(String text){
    if(text.isEmpty){
      return "Digite o Login";
    }
    return null;
  }
  String _validateName(String text){
    if(text.isEmpty){
      return "Digite o nome";
    }
    return null;
  }
  String _validateCPF(String text){
    int pontos;
    int traco;
    //List<String> cpf = email = text.split("@");
    if(!isValid(text)){
      return "CPF Inválido";
    }
    
    return null;
  }
  String _validateEmail(String text){
    List<String> email = text.split("@");
    print(text.indexOf('@')!=1);
    if(email.length!=2){
      return "Email inválido";
    }
    if(text.isEmpty){
      return "Digite o email";
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
  String _validateConfirmaSenha(String text){
    if(text != _tPassword.text){
      return "Ambas as senhas devem ser iguais";
    }
    if(text.isEmpty){
      return "Digite novemente a senha";
    }
    return null;
  }


  bool isValid(String cpf) {
    if (cpf == null) return false;

    // Obter somente os números do CPF
    var numeros = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o CPF possui 11 dígitos
    if (numeros.length != 11) return false;

    // Testar se todos os dígitos do CPF são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

    // Dividir dígitos
    List<int> digitos =
        numeros.split('').map((String d) => int.parse(d)).toList();

    // Calcular o primeiro dígito verificador
    var calcDv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digitos[10 - i] * i;
    }
    calcDv1 %= 11;
    var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    // Testar o primeiro dígito verificado
    if (digitos[9] != dv1) return false;

    // Calcular o segundo dígito verificador
    var calcDv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digitos[11 - i] * i;
    }
    calcDv2 %= 11;
    var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    // Testar o segundo dígito verificador
    if (digitos[10] != dv2) return false;

    return true;
  }


}


