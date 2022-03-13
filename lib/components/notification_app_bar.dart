import 'package:flutter/material.dart';

class NotificationAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(width: 10),
          Text(
            'Notification',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,

            ),
          ),
        ],
      ),
    );
  }
}

