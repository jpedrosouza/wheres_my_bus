import 'package:flutter/material.dart';
import 'package:wheres_my_bus/utils/auth.dart';

Widget drawer(BuildContext context) {
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
                  onTap: () =>
                      Navigator.popAndPushNamed(context, '/my_account'),
                  title: Text('Minha conta'),
                ),
                ListTile(
                  onTap: () =>
                      Navigator.popAndPushNamed(context, '/register_driver'),
                  title: Text('Sou motorista'),
                ),
                ListTile(
                  onTap: () {},
                  title: Text('Termos de uso'),
                ),
                ListTile(
                  onTap: () async {
                    await Auth().signOut();
                    Navigator.popAndPushNamed(context, '/login');
                  },
                  title: Text('Sair'),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
