import 'package:flutter/material.dart';

import '../widgets/sheets.dart';

class SendSheet {
  void mainBottomSheet(BuildContext context) {
    Sheets.showSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          minimum: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.035,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            constraints: BoxConstraints.expand(),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Stack(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 32),
                      Text(
                        'Send from'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'ban_1meme1yacdi5u69wc',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: Colors.white70),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '(18,800 BAN)',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.white54, fontSize: 14),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.105,
                          right: MediaQuery.of(context).size.width * 0.105,
                          top: 30,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter amount',
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.white54,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(color: Colors.white)
                                .color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Close Button
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(14.0),
                    highlightColor: Theme.of(context).textTheme.body1.color,
                    splashColor: Theme.of(context).textTheme.button.color,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
