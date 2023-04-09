import 'package:flutter/material.dart';
import 'package:saiyo_pets/constants/dimens.dart';
import 'package:saiyo_pets/presentation/settings/widgets/settings_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const SettingsAppBar(),
      backgroundColor: colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const _SettingsTile(
            child: ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(value: true, onChanged: null),
            ),
          ),
          const _SettingsTile(
            child: ListTile(
              title: Text('Language'),
              trailing: Text('English'),
            ),
          ),
          const _SettingsTile(
            child: ListTile(
              title: Text('About'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const _SettingsTile(
            child: ListTile(
              title: Text('Terms of Service'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const _SettingsTile(
            child: ListTile(
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const _SettingsTile(
            child: ListTile(
              title: Text('Contact Us'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const _SettingsTile(
            child: ListTile(
              title: Text('Rate Us'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const _SettingsTile(
            child: ListTile(
              title: Text('Share'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const _SettingsTile(
            child: ListTile(
              title: Text('Log Out'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: Dimens.brc16,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
