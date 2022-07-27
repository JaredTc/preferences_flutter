
import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/side_menu.dart';


class HomeScreen extends StatelessWidget {

  static const String routerName = 'Home';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text('isDarkMode: ${ Preferences.isDarkmode} '),
          Divider(),
          Text('Genero: ${ Preferences.gender } '),
          Divider(),
          Text('Nombre de usuario: ${ Preferences.name } '),

        ],
      )
   );
  }
}