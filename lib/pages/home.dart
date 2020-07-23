import 'package:flutter/material.dart';

import 'about.dart';
import 'gratitude.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _howAreYou = '...';

  void _openAboutPage({BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => About(),
      ),
    );
  }

  void _openPageGratitude({BuildContext context, bool fullScreenDialog = false}) async {
    final String _gratitudeResponse = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullScreenDialog,
        builder: (context) => Gratitude(
          radioGroupValue: -1,
        ),
      ),
    );
    setState(() {
      _howAreYou = _gratitudeResponse ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              _openAboutPage(
                context: context,
                fullscreenDialog: true,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openPageGratitude(context: context);
        },
        tooltip: 'About',
        child: Icon(Icons.sentiment_satisfied),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Grateful for: $_howAreYou',
              style: TextStyle(fontSize: 32.0),
            ),
          ),
        ),
      ),
    );
  }
}
