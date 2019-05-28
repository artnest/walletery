import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './ui/home_page.dart';
import './ui/util/routes.dart';
import './ui/passwords_page.dart';
import './ui/add_password_page.dart';

void main() => runApp(WalleteryApp());

class WalleteryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walletery',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Color(0xCC000000),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        );
        switch (settings.name) {
          case '/':
            return NoTransitionRoute(
              builder: (_) => HomePage(),
              settings: settings,
            );
          case '/passwords':
            return MaterialPageRoute(
              builder: (_) => PasswordsPage(),
              settings: settings,
            );
          case '/passwords/add_password':
            return MaterialPageRoute(
              builder: (_) => AddPasswordPage(),
              settings: settings,
            );
        }
      },
    );
  }
}
