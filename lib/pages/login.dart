import 'package:flutter/material.dart';
import 'package:wheres_my_bus/utils/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formLogin = GlobalKey<FormState>();

  String email, password;
  bool loginLoading = false;

  void validateAndLogin() async {
    setState(() {
      loginLoading = true;
    });

    if (formLogin.currentState.validate()) {
      if (await Auth().signIn(email, password)) {
        Navigator.popAndPushNamed(context, '/home');
      } else {
        setState(() {
          loginLoading = false;
        });
      }
    } else {
      setState(() {
        loginLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF08994D),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        'Where\'s My Bus?',
                        style: TextStyle(
                          color: Color(0XFFF7B731),
                          fontFamily: 'Prompt',
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                  child: formLoginWidget(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    buttonColor: Color(0XFFF7B731),
                    child: RaisedButton(
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: () => validateAndLogin(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    buttonColor: Color(0XFF3867D6),
                    child: RaisedButton(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/register'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/forgot_password'),
                    child: Text(
                      'Esqueci minha senha',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget formLoginWidget() {
    return Form(
      key: formLogin,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            onChanged: (newValue) => email = newValue,
            validator: (value) => value.isEmpty ? 'Informe seu email.' : null,
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
            child: TextFormField(
              autocorrect: false,
              onChanged: (newValue) => password = newValue,
              obscureText: true,
              validator: (value) => value.isEmpty ? 'Informe sua senha.' : null,
              decoration: InputDecoration(
                hintText: 'Senha...',
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
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
        ],
      ),
    );
  }
}
