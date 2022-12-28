import 'package:flutter/material.dart';
import 'package:preferences_app/provider/theme_provider.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //bool _darkMode = false;
  //int gender = 1;
  //String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SettingsScreen'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const Text('Settings', style: TextStyle(fontSize: 45)),
            const Divider(),
            SwitchListTile.adaptive(
              value: Preferences.darkMode,
              title: const Text('Dark Mode'),
              onChanged: (value) {
                setState(() {
                  Preferences.darkMode = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                  value ? themeProvider.setDarkTheme() : themeProvider.setLightTheme();
                });
              },
              activeColor: Colors.deepPurple,
            ),
            RadioListTile<int>(
              value: 1,
              title: const Text('Masculino'),
              groupValue: Preferences.gender,
              onChanged: (value) {
                setState(() {
                  Preferences.gender = value ?? 1;
                });
              },
            ),
            RadioListTile<int>(
              value: 2,
              title: const Text('Femenino'),
              groupValue: Preferences.gender,
              onChanged: (value) {
                setState(() {
                  Preferences.gender = value ?? 2;
                });
              },
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el teléfono',
                ),
                onChanged: (value) {
                  setState(() {
                    Preferences.name = value;
                  });
                },
                initialValue: Preferences.name,
                textCapitalization: TextCapitalization.words,
              ),
            ),
          ],
        )),
        drawer: const SideMenu());
  }
}
