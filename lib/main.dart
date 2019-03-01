import 'package:flutter/material.dart';

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

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xCC000000),
          padding: const EdgeInsets.all(16),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Column(
                children: <Widget>[
                  BalanceCard('~18,800'),
                  TransactionsTitle(),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        TransactionCard('12,794 BYN'),
                        TransactionCard('12,794 BYN'),
                        TransactionCard('12,794 BYN'),
                        TransactionCard('12,794 BYN'),
                        TransactionCard('12,794 BYN'),
                        TransactionCard('12,794 BYN'),
                        TransactionCard('12,794 BYN'),
                        TransactionCard('12,794 BYN'),
                        TransactionCard('12,794 BYN'),
                        TransactionCard('12,794 BYN'),
                      ],
                    ),
                  )
                ],
              ),
              Actions(),
            ],
          ),
        ),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard(this.balance, {Key key}) : super(key: key);

  final String balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 112,
      child: Card(
        color: Colors.white24,
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Text(
                balance,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.white70,
                  onPressed: () {
                    // TODO
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionsTitle extends StatelessWidget {
  const TransactionsTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        'TRANSACTIONS',
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard(this.amount, {Key key}) : super(key: key);

  final String amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white24,
      child: ListTile(
        leading: Icon(
          Icons.add_circle_outline,
          color: Colors.yellow[600],
        ),
        title: Text('Received'),
        subtitle: Text(amount),
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ActionButton('Receive'),
          ActionButton('Send'),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton(this.action, {Key key}) : super(key: key);

  final String action;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.yellow,
      child: Text(action),
      onPressed: () {
        // TODO
      },
    );
  }
}
