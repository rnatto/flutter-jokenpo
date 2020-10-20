import 'package:flutter/material.dart';
import 'package:jokenpo/presentation/jokenpo_icons_icons.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _option = '';
  String _option2 = '';
  String _winner = '';

  void _setPaperOption() {
      _option = 'Papel';
    _checkWinner();
    setState(() {
    });
  }

  void _setRockOption() {
      _option = 'Pedra';
    _checkWinner();
    setState(() {
    });
  }

  void _setScissorOption() {
      _option = 'Tesoura';
    _checkWinner();
    setState(() {
    });
  }

  void _checkWinner() {
    setState(() {
      var rng = new Random(); 
      int opt2 = rng.nextInt(3);
      _option2 = opt2 == 0 ? 
        'Pedra' :
          opt2 == 1 ?
          'Papel' : 
            'Tesoura';
      int winner;
      if (_option == _option2) {
        winner = 0;
      } else if ((_option == 'Pedra' && _option2 == 'Tesoura') ||
          (_option == 'Papel' && _option2 == 'Pedra') ||
          (_option == 'Tesoura' && _option2 == 'Papel')) {
        winner = 1;
      } else {
        winner = -1;
      }
      if (winner > 0) {
        _winner = 'Você venceu!';
      }
      if (winner < 0) {
        _winner = 'Você perdeu :(';
      }
      if (winner == 0) {
        _winner = 'Empatou';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_option x $_option2',
            ),
            Text(
              '$_winner',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _setRockOption,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
// Added column with 3 buttons
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: _setRockOption,
              tooltip: 'Pedra',
              child: Icon(JokenpoIcons.hand_rock),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: _setPaperOption,
              tooltip: 'Papel',
              child: Icon(JokenpoIcons.hand_paper),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: _setScissorOption,
              tooltip: 'Tesoura',
              child: Icon(JokenpoIcons.hand_scissors),
            ),
          ),
        ],
      ),
    );
  }
}
