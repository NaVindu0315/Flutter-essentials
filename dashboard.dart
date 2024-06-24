import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dash(),
    );
  }
}

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        leading: null,
        actions: <Widget>[],
        title: Text(
          '                 AppBar',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xff237ACC),
      ),
      body: Column(
        children: [
          Spacer(),
          Row(
            children: [
              Spacer(),
              ElevatedButton(onPressed: () {}, child: Text('Next Page')),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}

