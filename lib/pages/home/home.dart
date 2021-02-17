import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wheres_my_bus/pages/home/widgets/drawer.dart';
import 'package:wheres_my_bus/utils/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  DateTime date;

  var styleWeatherContainer =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500);

  String userName, max, min, rain;
  bool loading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    userName = await Auth().getUserName();

    date = DateTime.now();

    await _firebaseDatabase
        .reference()
        .child('Crawler')
        .child('Clima')
        .once()
        .then((data) {
      setState(() {
        max = data.value['max'].toString();
        min = data.value['min'].toString();
        rain = data.value['prob'].toString();
      });
    });

    setState(() {
      loading = false;
    });
  }

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
      drawer: drawer(context),
      body: Stack(
        children: [
          !loading
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Bem Vindo (a) $userName',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
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
                                  padding: EdgeInsets.only(
                                      top: 40, left: 20, right: 20),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Máxima: $max C',
                                            style: styleWeatherContainer,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 30),
                                            child: Text(
                                              'Mínima: $min C',
                                              style: styleWeatherContainer,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Data: ${date.day}/${date.month}/${date.year}',
                                            style: styleWeatherContainer,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 30),
                                            child: Text(
                                              '% de chuva: $rain',
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
                            onPressed: () =>
                                Navigator.pushNamed(context, '/map'),
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
                            onPressed: () =>
                                Navigator.pushNamed(context, '/project'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
