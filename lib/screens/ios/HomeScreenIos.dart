import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/appProviders/ThemeSwitchProvider.dart';
import 'package:provider/provider.dart';

class HomeScreenIos extends StatefulWidget {
  HomeScreenIos({this.title = ""});

  final String title;

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenIos> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoIsScrolled) {
          return <Widget>[
            Consumer<ThemeSwitchProvider>(
                builder: (context, themeProvider, child) =>
                    CupertinoSliverNavigationBar(
                      largeTitle: Text(widget.title),
                      trailing: GestureDetector(
                          onTap: () => themeProvider
                              .updateAppTheme(!themeProvider.isLightTheme),
                          child: Icon(CupertinoIcons.circle_lefthalf_fill)),
                    )),
          ];
        },
        body: Stack(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text('$_counter'),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(20.0),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
        ]),
      ),
    );
  }
}
