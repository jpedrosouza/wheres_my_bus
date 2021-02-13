import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF08994D),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 150,
              child: Column(
                children: [
                  Text(
                    'Where\'s My Bus?',
                    style: TextStyle(
                      color: Color(0XFFF7B731),
                      fontFamily: 'Prompt',
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: CircularProgressIndicator())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
