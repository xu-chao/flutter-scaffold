import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设备'),
        centerTitle: true,
        leading: new Icon(Icons.android),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.green,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('设备'),
          ],
        ),
      ),
    );
  }
}
