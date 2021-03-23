import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class InfoPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          child:
              Text("INFORMAÇÕES", style: GoogleFonts.bebasNeue(color: Color(0xFFde3163), fontSize: 37),),
              
          alignment: Alignment.centerLeft,
        ),
        backgroundColor: Color(0xFFffffff),
      ),
      body: Container(
        //color: Color(0xFFD3D3D3),
        child: _bodyInformacoes(),
      ),
    );
  }
}

_bodyInformacoes(){
  return Container(
    child: Padding(
      padding: EdgeInsets.only(right: 23, left:23, top: 5, bottom: 15 ),
      child: _listInformacoes(),
    ),
  );
}

_listInformacoes(){
  return ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              '\nREQUISITOS PARA DOAÇÃO DE SANGUE',
              style: GoogleFonts.montserrat(color: Color(0xFFde3163), fontSize: 18.5),
              
            ),
          ),
          Align(
            child: Text(
              '\n\n   Podem doar sangue pessoas entre 16 e 69 anos e que estejam pesando mais de 50kg.\n   Além disso, é preciso apresentar documento oficial com foto e menores de 18 anos só podem doar com consentimento formal dos responsáveis.\n   Pessoas com febre, gripe ou resfriado, diarreia recente, grávidas e mulheres no pós-parto não podem doar temporariamente.\n   O procedimento para doação de sangue é simples, rápido e totalmente seguro.\n   Não há riscos para o doador, porque nenhum material usado na coleta do sangue é reutilizado, o que elimina qualquer possibilidade de contaminação.',
              style:  GoogleFonts.montserrat(color: Colors.black, fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ),
          Text(
            '\n\nOs requisitos para doar sangue é estar com bom estado de saúde e seguir os seguintes passos:',
            style: GoogleFonts.montserrat(color: Color(0xFFde3163), fontSize: 17), 
           
          ),
          Align(
            child: Text(
              '\n\nEstar alimentado. Evite alimentos gordurosos nas 3 horas que antecedem a doação de sangue.\n\nCaso seja após o almoço, aguardar 2 horas.\n\nTer dormido pelo menos 6 horas nas últimas 24 horas.\nPessoas com idade entre 60 e 69 anos só poderão doar sangue se já o tiverem feito antes dos 60 anos.\n\nA frequência máxima é de quatro doações de sangue anuais para o homem e de três doações de sangue anuais para as mulher.\n\nO intervalo mínimo entre uma doação de sangue e outra é de dois meses para os homens e de três meses para as mulheres.',
              style:  GoogleFonts.montserrat(color: Colors.black, fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '\n\nOs impedimentos temporários para doar sangue',
              style: GoogleFonts.montserrat(color: Color(0xFFde3163), fontSize: 17),
             
            ),
          ),
          Align(
            child: Text(
              '\n\n   Gripe, resfriado e febre: aguardar 7 dias após o desaparecimento dos sintomas;\n   Período gestacional;\nPeríodo pós-gravidez: 90 dias para parto normal e 180 dias para cesariana;\n   Amamentação: até 12 meses após o parto;\nIngestão de bebida alcoólica nas 12 horas que antecedem a doação;\n   Tatuagem e/ou piercing nos últimos 12 meses (piercing em cavidade oral ou região genital impedem a doação);\n   Extração dentária: 72 horas;\n   Apendicite, hérnia, amigdalectomia, varizes: 3 meses;\n   Colecistectomia, histerectomia, nefrectomia, redução de fraturas, politraumatismos sem seqüelas graves, tireoidectomia, colectomia: 6 meses;\n   Transfusão de sangue: 1 ano;\n   Vacinação: o tempo de impedimento varia de acordo com o tipo de vacina;\n   Exames/procedimentos com utilização de endoscópio nos últimos 6 meses;\n   Ter sido exposto a situações de risco acrescido para infecções sexualmente transmissíveis (aguardar 12 meses após a exposição).',
              style: GoogleFonts.montserrat(color: Colors.black, fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
  );
}
