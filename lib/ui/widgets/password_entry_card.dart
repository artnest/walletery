import 'package:flutter/material.dart';

class EntryCard extends StatelessWidget {
  final String name;
  final String email;

  EntryCard({@required this.name, @required this.email});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFAFFFFFF),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(name),
                    SizedBox(height: 4),
                    Text(email),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.orange[700],
              onPressed: () {
                /*showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (ctx) => PasswordEntryEditDialog(entry: entry),
                );*/
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red[600],
              onPressed: () {
                // BlocProvider.provideBloc(context).deleteEntry(entry);
              },
            )
          ],
        ),
      ),
    );
  }
}
