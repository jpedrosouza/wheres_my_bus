import 'package:flutter/material.dart';
import 'package:wheres_my_bus/database/models/user.model.dart';
import 'package:wheres_my_bus/utils/auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var txtEmail = TextEditingController();
  var txtName = TextEditingController();
  var txtLastName = TextEditingController();
  var txtPassword = TextEditingController();
  var txtConfirmPassword = TextEditingController();

  bool checkBox = false;

  void validate() async {
    if (formKey.currentState.validate()) {
      if (checkBox) {
        if (txtPassword.text == txtConfirmPassword.text) {
          var fullName = txtName.text + ' ' + txtLastName.text;

          UserModel userModel = UserModel(txtEmail.text, fullName);

          await Auth()
              .createUser(txtEmail.text, txtPassword.text, fullName, userModel);

          Navigator.pushNamed(context, '/home');
        } else {
          scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(
                'Insira senhas iguais',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Prompt',
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: Colors.white,
              duration: Duration(seconds: 1),
            ),
          );
        }
      } else {
        scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              'Para usar o app você usar o app é preciso concordar com os termos de uso',
              style: TextStyle(
                color: Colors.blue,
                fontFamily: 'Prompt',
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: Colors.white,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0XFF08994D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: txtEmail,
                          autocorrect: false,
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
                          child: TextFormField(
                            controller: txtName,
                            autocorrect: true,
                            validator: (value) =>
                                value.isEmpty ? 'Informe seu nome.' : null,
                            decoration: InputDecoration(
                              hintText: 'Nome...',
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
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: txtLastName,
                            autocorrect: true,
                            validator: (value) =>
                                value.isEmpty ? 'Informe seu sobrenome.' : null,
                            decoration: InputDecoration(
                              hintText: 'Sobrenome...',
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
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: txtPassword,
                            autocorrect: false,
                            obscureText: true,
                            validator: (value) =>
                                value.isEmpty ? 'Informe sua senha.' : null,
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
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: txtConfirmPassword,
                            autocorrect: false,
                            obscureText: true,
                            validator: (value) =>
                                value.isEmpty ? 'Confirme sua senha.' : null,
                            decoration: InputDecoration(
                              hintText: 'Confirmar senha...',
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      Checkbox(
                        value: checkBox,
                        onChanged: (value) {
                          setState(() {
                            checkBox = value;
                          });
                        },
                        activeColor: Color(0XFF3867D6),
                      ),
                      Text(
                        'Eu concordo com os termos de uso.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
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
                      onPressed: () => validate(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
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
}
