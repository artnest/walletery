import 'package:flutter/material.dart';

import './ui/home_page.dart';
import './ui/util/routes.dart';

void main() => runApp(WalleteryApp());

class WalleteryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walletery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return NoTransitionRoute(
              builder: (_) => HomePage(),
              settings: settings,
            );
          case '/home':
            return NoTransitionRoute(
              builder: (_) => HomePage(),
              settings: settings,
            );
        }
      },
    );
  }
}
