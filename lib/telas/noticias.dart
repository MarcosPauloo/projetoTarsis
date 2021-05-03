import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projetotarsisio/telas/cadastro.dart';
import 'package:projetotarsisio/utils/OnClickNavigator.dart';
import 'package:projetotarsisio/telas/login.dart';
import 'package:projetotarsisio/telas/infopag.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Noticias extends StatefulWidget{
  @override
  _TelaNoticiasState createState() => _TelaNoticiasState();
}
class _TelaNoticiasState extends State<Noticias>{
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
        child: cardNoticia(
          context,
          "Sem sangue do tipo B negativo, Hemoal abre para doação no Feriado do Dia do Trabalho", 
          "Para repor o estoque de sangue do tipo B Negativo, que está zerado, o Hemocentro de Alagoas (Hemoal) funciona para doação neste sábado (1º), feriado do Dia do Trabalho.",
          "https://mega.ibxk.com.br/2018/06/04/bolsa-de-sangue-04111320700123.jpg?ims=610x",
          "https://www.saude.al.gov.br/hemoal-abre-para-doacao-de-sangue-no-feriado-do-dia-do-trabalho/", ),
      ),
      Padding(
        padding: EdgeInsets.only(top:20.0, right:15.0, left:15.0),
        child: cardNoticia(
          context,
          "Covid-19: Hemoal agenda doação de sangue para evitar aglomerações",
          "Órgão está com o estoque crítico e necessita de transfusões para atender os hospitais.",
          "https://media.correiodocidadao.com.br/2020/10/b0df06d5-imagem_coronavirus-covid-19.jpg",
          "http://agenciaalagoas.al.gov.br/noticia/item/32592-covid-19-hemoal-agenda-doacao-de-sangue-para-evitar-aglomeracoes"),
      ),
      Padding(
        padding: EdgeInsets.only(top:20.0, right:15.0, left:15.0),
        child: cardNoticia(
          context,
          "Doador de sangue: o cidadão solidário que pode salvar até quatro vidas com uma só doação",
          "Você sabia que apenas uma bolsa de sangue pode salvar até quatro vidas? Pois é, a depender da necessidade do paciente, o sangue vindo do doador pode ajudar a devolver a saúde de quatro pessoas que estão nos leitos dos hospitais, aguardando esse gesto de solidariedade.",
          "https://www.portalbueno.com.br/uploads/cache/16-03-2018-045849-480-690x460-1486db12-portalbueno.webp",
          "http://www.grupoamigo.com.br/noticias/exibir/doador-de-sangue-o-cidadao-solidario-que-pode-salvar-ate-quatro-vidas-com-uma-so-doacao"),
      ),
      Padding(
        padding: EdgeInsets.only(top:20.0, right:15.0, left:15.0),
        child: cardNoticia(
          context,
          "Seja um doador de Sangue!",
          "Ser doador de sangue é mais que um gesto de ajuda ao próximo, é um exercício do caráter e que traz grandes benefícios ao doador.",
          "https://www.diariodetaubateregiao.com.br/dt/wp-content/uploads/2019/06/foto-11-3.jpg",
          "https://hospitaldocoracaoal.com.br/noticias/219/seja-um-doador-de-sangue"),
      ),
      Padding(
        padding: EdgeInsets.only(top:20.0, right:15.0, left:15.0),
        child: cardNoticia(
          context,
          "SMTT reúne colaboradores voluntários para doação de sangue",
          "Como ação de solidariedade e conscientização sobre a importância da doação de sangue, colaboradores e agentes da Superintendência Municipal de Transporte e Trânsito (SMTT) de Arapiraca estiveram hoje na sede do Hemocentro.",
          "https://arapiraca.nyc3.cdn.digitaloceanspaces.com/2021/02/WhatsAppImage20210205at15.53.19.jpeg",
          "https://web.arapiraca.al.gov.br/2021/02/smtt-reune-colaboradores-voluntarios-para-doacao-de-sangue/"),
      ),
    ],
  );
}

Card cardNoticia(context, titulo, conteudo, src,url) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(src),
          _tituloNoticia(titulo),
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
           onPressed:  () => _openURL(url),
           
          )
        ),
        ],
      ),
      ),
    );
}
_openURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    /// Não è possível abrir a URL
  }
}
_tituloNoticia(titulo){
  return Text(
    titulo, 
    style: GoogleFonts.montserrat(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold));
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
