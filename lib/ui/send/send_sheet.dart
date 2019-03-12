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
          child: Column(
            children: <Widget>[
              // A row for the header of the sheet, balance text and close button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Close Button
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(top: 10.0, left: 10.0),
                    child: FlatButton(
                      highlightColor: Theme.of(context).textTheme.body1.color,
                      splashColor: Theme.of(context).textTheme.button.color,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(17.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
