import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var styleWeatherContainer =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
  var styleListTileDrawer = TextStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF08994D),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Where\'s My Bus?',
          style: TextStyle(
            color: Color(0XFFF7B731),
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0XFF3867D6),
      ),
      drawer: drawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Bem Vindo (a) João Pedro!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Color(0XFFF7B731),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Text(
                                'Previsão do tempo para sua região',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 40, left: 20, right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Máxima: 28°C',
                                      style: styleWeatherContainer,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Text(
                                        'Mínima: 24°C',
                                        style: styleWeatherContainer,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Data: 11/02/2021',
                                      style: styleWeatherContainer,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Text(
                                        '% de chuva: 5%',
                                        style: styleWeatherContainer,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    buttonColor: Color(0XFFF7B731),
                    child: RaisedButton(
                      child: Text(
                        'Mapa',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/map'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    buttonColor: Color(0XFFF7B731),
                    child: RaisedButton(
                      child: Text(
                        'O Projeto',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: () => null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    title: Text(
                      'Minha conta',
                      style: styleListTileDrawer,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      'Sou motorista',
                      style: styleListTileDrawer,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      'Termos de uso',
                      style: styleListTileDrawer,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      'Sair',
                      style: styleListTileDrawer,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
