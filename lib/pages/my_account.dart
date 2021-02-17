import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wheres_my_bus/utils/auth.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  var textStyle = TextStyle(color: Colors.white, fontSize: 16);

  String userName, userEmail;
  bool loading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(await Auth().getUserUid())
        .get()
        .then((document) {
      setState(() {
        userName = document.get('name');
        userEmail = document.get('email');
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
          'Sua Conta',
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
              child: !loading
                  ? Container(
                      height: 330,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 80,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Nome: ',
                                  style: textStyle,
                                ),
                                Text(
                                  '$userName',
                                  style: textStyle,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Email: ',
                                  style: textStyle,
                                ),
                                Text(
                                  '$userEmail',
                                  style: textStyle,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              'Firmando compromisso com a sua privacidade, as informações acima são os seus dados que possuímos armazenados.',
                              style: textStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
