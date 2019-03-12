import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xCC000000),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BalanceCard('~18,800'),
            TransactionsTitle(),
            Expanded(
              child: _buildListView(),
            ),
            Actions(),
          ],
        ),
      ),
    );
  }

  ListView _buildListView() {
    return ListView(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
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
      margin: EdgeInsets.only(
        left: 14.0,
        right: 14.0,
        top: MediaQuery.of(context).size.height * 0.005,
      ),
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
      margin: EdgeInsets.fromLTRB(30, 20, 26, 0),
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
    return Container(
      margin: EdgeInsets.fromLTRB(14.0, 4.0, 14.0, 4.0),
      child: Card(
        color: Colors.white24,
        child: ListTile(
          leading: Icon(
            Icons.add_circle_outline,
            color: Colors.yellow[600],
          ),
          title: Text('Received'),
          subtitle: Text(amount),
        ),
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
        children: <Widget>[
          Expanded(child: ActionButton('Receive')),
          Expanded(child: ActionButton('Send')),
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        // shadows
      ),
      height: 56,
      margin: EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: Colors.yellow,
        child: Text(action, maxLines: 1),
        splashColor: Colors.transparent,
        onPressed: () {
          // TODO
        },
      ),
    );
  }
}