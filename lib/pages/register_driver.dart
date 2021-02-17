import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wheres_my_bus/database/controller/user.controller.dart';
import 'package:wheres_my_bus/utils/auth.dart';

class RegisterDriver extends StatefulWidget {
  @override
  _RegisterDriverState createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver> {
  var styleText = TextStyle(color: Colors.white, fontSize: 16);
  var currentIndex = 0;

  var formKey = GlobalKey<FormState>();

  var txtName = TextEditingController();
  var txtCPF = TextEditingController();

  void changePageIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future validateAndRegister() async {
    if (formKey.currentState.validate()) {
      String userId = await Auth().getUserUid();
      await UserController().registerDriver(userId, txtName.text, txtCPF.text);
      changePageIndex(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF08994D),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Registrar Motorista',
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
              child: pagesControl(),
            ),
          ),
        ],
      ),
    );
  }

  Widget pagesControl() {
    switch (currentIndex) {
      case 0:
        return presentationWidget();
        break;
      case 1:
        return registerWidget();
        break;
      case 2:
        return confirmRegisterWidget();
      default:
        return null;
    }
  }

  Widget presentationWidget() {
    return Container(
      height: 526,
      child: Column(
        children: [
          Text(
            'Como motorista, você pode transmitir ao vivo sua localização para que outros usuários saibam em tempo real em qual lugar esta o seu ônibus.',
            style: styleText,
          ),
          Text(
            'Para se cadastrar como motorista, você precisa inserir seus dados como Nome e CPF. Dados que serão checados com sua empresa e assim que confirmados, farão com que sua conta esteja habilitada a transmitir localização em tempo real.',
            style: styleText,
          ),
          Text(
            'Se tornando um motorista parceiro, você melhora a vida de milhares de pessoas que dependem do transporte público em seu dia a dia, além de melhorar a segurança e dar mais conforto aos mesmos. Para prosseguir com seu cadastro, basta clicar no botão “Prosseguir”.',
            style: styleText,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ButtonTheme(
              minWidth: 300,
              height: 50,
              buttonColor: Color(0XFFF7B731),
              child: RaisedButton(
                child: Text(
                  'Prosseguir',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onPressed: () => changePageIndex(1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget registerWidget() {
    return Container(
      height: 300,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: txtName,
              autocorrect: true,
              validator: (value) => value.isEmpty ? 'Informe seu nome.' : null,
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
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: txtCPF,
                autocorrect: false,
                validator: (value) => value.isEmpty ? 'Informe seu CPF.' : null,
                decoration: InputDecoration(
                  hintText: 'CPF...',
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
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: ButtonTheme(
                minWidth: 300,
                height: 50,
                buttonColor: Color(0XFFF7B731),
                child: RaisedButton(
                  child: Text(
                    'Enviar',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  onPressed: () => validateAndRegister(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget confirmRegisterWidget() {
    return Container(
      height: 330,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/check_circle_outline-white.svg',
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Seus dados foram enviados com sucesso! Depois que analizarmos, iremos te enviar um email informando se sua conta foi aprovada ou não para transmitir localização em tempo real.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: ButtonTheme(
              minWidth: 300,
              height: 50,
              buttonColor: Color(0XFFF7B731),
              child: RaisedButton(
                child: Text(
                  'Concluir',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
