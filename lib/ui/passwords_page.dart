import 'package:flutter/material.dart';

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
            PasswordItem(name: 'AirBnb', email: 'fan@walletery.com'),
            PasswordItem(name: 'Evernote', email: 'fan@walletery.com'),
            PasswordItem(name: 'Facebook', email: 'fan@walletery.com'),
            PasswordItem(name: 'VK', email: 'fan@walletery.com'),
            PasswordItem(name: 'Netflix', email: 'fan@walletery.com'),
            PasswordItem(name: 'Slack', email: 'fan@walletery.com'),
            PasswordItem(name: 'Gmail', email: 'fan@walletery.com'),
            PasswordItem(name: 'Twitter', email: 'fan@walletery.com'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/passwords/new_password');
        },
      ),
    );
  }
}

class PasswordItem extends StatelessWidget {
  final String name;
  final String email;

  PasswordItem({@required this.name, @required this.email, Function i});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFAFFFFFF),
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(name),
        subtitle: Text(email),
      ),
    );
  }
}
