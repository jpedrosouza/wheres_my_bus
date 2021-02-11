import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF08994D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Container(
            height: 250,
            child: Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  // onSaved: (newValue) => _email = newValue,
                  validator: (value) =>
                      value.isEmpty ? 'Informe seu email.' : null,
                  decoration: InputDecoration(
                    hintText: 'Email...',
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                      'Um email será enviado para que você consiga escolher uma senha nova.',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    buttonColor: Colors.white,
                    child: RaisedButton(
                      child: Text(
                        'Resetar senha',
                        style: TextStyle(
                          color: Color(0XFF3867D6),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
