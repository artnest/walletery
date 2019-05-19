import 'package:flutter/material.dart';

import 'widgets/password_entry_card.dart';

class PasswordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passwords'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            EntryCard(name: 'AirBnb', email: 'fan@walletery.com'),
            EntryCard(name: 'Evernote', email: 'fan@walletery.com'),
            EntryCard(name: 'Facebook', email: 'fan@walletery.com'),
            EntryCard(name: 'VK', email: 'fan@walletery.com'),
            EntryCard(name: 'Netflix', email: 'fan@walletery.com'),
            EntryCard(name: 'Slack', email: 'fan@walletery.com'),
            EntryCard(name: 'Gmail', email: 'fan@walletery.com'),
            EntryCard(name: 'Twitter', email: 'fan@walletery.com'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/passwords/new_password');
        },
      ),
    );
  }
}
