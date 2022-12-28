import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _gender = Preferences.gender == 1 ? 'Masculino' : 'Femenino';
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dark Mode: ${Theme.of(context).brightness}'),
              const Divider(),
              Text('Género: ${_gender}'),
              const Divider(),
              Text('Nombre de usuario: ${Preferences.name}'),
              const Divider(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
                child: const Text('Settings'),
              ),
            ],
          ),
        ),
        drawer: const SideMenu());
  }
}
