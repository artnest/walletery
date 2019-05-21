import 'package:flutter/material.dart';

import './send/send_sheet.dart';

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
        TransactionCard('12,794 BAN', isSent: false),
        TransactionCard('12,794 BAN', isSent: true),
        TransactionCard('12,794 BAN', isSent: false),
        TransactionCard('12,794 BAN', isSent: false),
        TransactionCard('12,794 BAN', isSent: true),
        TransactionCard('12,794 BAN', isSent: true),
        TransactionCard('12,794 BAN', isSent: false),
        TransactionCard('12,794 BAN', isSent: false),
        TransactionCard('12,794 BAN', isSent: true),
        TransactionCard('12,794 BAN', isSent: false),
      ],
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard(this.balance, {Key key}) : super(key: key);

  final String balance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/passwords');
      },
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
        'Transactions'.toUpperCase(),
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard(this.amount, {Key key, @required this.isSent})
      : super(key: key);

  final String amount;
  final bool isSent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(14.0, 4.0, 14.0, 4.0),
      child: Card(
        color: Colors.white24,
        child: ListTile(
          leading: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(
              isSent ? Icons.remove_circle_outline : Icons.add_circle_outline,
              color: isSent ? Colors.grey[400] : Colors.yellow[600],
            ),
          ),
          title: Text(
            isSent ? 'Sent' : 'Received',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            amount,
            style: TextStyle(color: Colors.yellow[400]),
          ),
          trailing: Container(
            width: 116,
            child: Text(
              "ban_4g8v4qi2t61eb9pm4qee",
              style: TextStyle(color: Colors.white54),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
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
      padding: EdgeInsets.symmetric(horizontal: 4),
      color: Colors.black54,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ActionButton(
              'Receive',
              onPressed: () {
                // TODO
              },
            ),
          ),
          Expanded(
            child: ActionButton(
              'Send',
              onPressed: () {
                SendSheet().mainBottomSheet(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton(
    this.action, {
    Key key,
    @required onPressed,
  })  : _onPressed = onPressed,
        super(key: key);

  final String action;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        // shadows
      ),
      height: 48,
      margin: EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: Colors.yellow,
        child: Text(
          action,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        splashColor: Colors.transparent,
        onPressed: _onPressed,
      ),
    );
  }
}
