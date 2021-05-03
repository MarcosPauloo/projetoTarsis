import 'dart:convert';

import 'package:projetotarsisio/classes/endereco.dart';

import 'package:http/http.dart' as http;
class EnderecoApi{

  Future<Endereco> procurarCEP(String cep) async {

    String url = "viacep.com.br";
    String path = "/ws/"+cep+"/json/";

    final response = await http.get(Uri.https(url, path));

    Endereco end;

    if(response.statusCode == 200){
      end = Endereco.fromJson(json.decode(response.body));
      print(end);
    } else {
      throw new Exception('Ocorreu um erro na api');
    }
    return end;
  }

}