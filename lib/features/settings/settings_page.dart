import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: const [
          ListTile(title: Text('Theme')), // TODO: 主题切换
          ListTile(title: Text('Language')), // TODO: 语言切换
        ],
      ),
    );
  }
}
