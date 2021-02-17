import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF08994D),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'O Projeto',
          style: TextStyle(
            color: Color(0XFFF7B731),
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0XFF3867D6),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Text(
                'O Where\'s My Bus foi criado com o objetivo de melhorar e dar mais conforto ao transporte público realizado por ônibus, fazendo com que os usuários possam saber em tempo real aonde estão seus ônibus e assim economizarem tempo ao invés de passarem muitos minutos desconfortáveis (ou até mesmo perigosos) em paradas de ônibus. Pelo fato de nosso app ser comunitário e de baixo custo, ele depende totalmente da cooperação de motoristas e empresas para seu funcionamento, já que para saber a localização exata de um ônibus, os motoristas precisam estar com seus celulares transmitindo a localização durante todo o período do trajeto.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
