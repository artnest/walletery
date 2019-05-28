import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;

  const PasswordTextField({Key key, this.controller, this.onSubmitted}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passwordInvisible;

  @override
  void initState() {
    super.initState();
    passwordInvisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: widget.controller,
      obscureText: passwordInvisible,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white30,
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.yellow),
        suffixIcon: IconButton(
          icon: Icon(
            passwordInvisible ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              passwordInvisible = !passwordInvisible;
            });
          },
        ),
      ),
      onSubmitted: widget.onSubmitted,
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
