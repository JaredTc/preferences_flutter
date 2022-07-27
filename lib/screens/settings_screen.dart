import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkmode = false;
  // int? gender = 1;
  // String name = 'Pedro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              CupertinoFormRow(
                prefix: Text('DarkMode'),
                child: CupertinoSwitch(
                  value: Preferences.isDarkmode,
                  onChanged: (value) {
                    Preferences.isDarkmode = value;
                    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

                    value 
                    ? themeProvider.setDarkMode() 
                    : themeProvider.setLightMode();

                    setState(() {});
                  },
                ),
              ),
              const Divider(),
              RadioListTile(
                  title: const Text('Masculino'),
                  value: 1,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = (value ?? 1) as int?;
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile(
                  title: const Text('Femenino'),
                  value: 2,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = (value ?? 2) as int?;
                    setState(() {});
                  }),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue:  Preferences.name,
                  decoration: const InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre del usuario',
                      icon: Icon(Icons.person)),
                  onChanged: (value) {
                     Preferences.name = value;
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ));
  }
}
