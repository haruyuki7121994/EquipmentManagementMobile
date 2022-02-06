import "package:flutter/material.dart";

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Search'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: TextButtonTheme(
          data: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.black87,
              alignment: Alignment.centerLeft,
            ),
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            TextButton(
              onPressed: () {  },
              child: Text('Floor scale F100',textAlign: TextAlign.left),
            ),
            TextButton(
              onPressed: () {  },
              child: Text('Lab scale S20'),
            ),
            TextButton(
              onPressed: () {  },
              child: Text('Tank scale T110'),
            ),
          ],
        ),
      ),
    ));
  }
}
