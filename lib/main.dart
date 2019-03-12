import 'package:flutter/material.dart';

import './ui/home_page.dart';

void main() => runApp(WalleteryApp());

class WalleteryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walletery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
