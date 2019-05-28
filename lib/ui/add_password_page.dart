import 'package:flutter/material.dart';

import 'widgets/password_text_field.dart';

class AddPasswordPage extends StatefulWidget {
  @override
  _AddPasswordPageState createState() => _AddPasswordPageState();
}

class _AddPasswordPageState extends State<AddPasswordPage> {
  final _serviceNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Password'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
              controller: _serviceNameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white30,
                labelText: 'Service Name',
                labelStyle: TextStyle(color: Colors.yellow),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white30,
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.yellow),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: PasswordTextField(
              controller: _passwordController,
              onSubmitted: (_) => _addEntry(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: _addEntry,
      ),
    );
  }

  @override
  void dispose() {
    _serviceNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _addEntry() {
    if (_serviceNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      /*BlocProvider.provideBloc(context).createEntry(
        _serviceNameController.text,
        _emailController.text,
        _passwordController.text,
      );*/
      // Navigator.of(context).pop();
      Navigator.of(context).pop([
        _serviceNameController.value,
        _emailController.value,
        _passwordController.value
      ]);
    }
  }
}
