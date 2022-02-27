import 'package:flutter/material.dart';

class HistoryAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Text(
            'Recent Search',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
