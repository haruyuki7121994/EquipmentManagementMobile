import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String created_at;

  const NotificationItem({Key? key, required this.title, required this.icon, required this.created_at, required String this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 10,
              margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Icon(icon),
            ),
            Expanded(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    overflow: TextOverflow.visible,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            )
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    description,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    created_at,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
