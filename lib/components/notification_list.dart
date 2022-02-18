import 'package:flutter/material.dart';
import 'package:appqrcode/components/notification_item.dart';

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This Week',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20,),
          NotificationItem(
            title: 'S100 scale due date maintenance',
            content: "Complete required maintenance tasks",
            icon: Icons.mail_outline,
            date: '10th October 2020',
          ),
          SizedBox(height: 20,),
          NotificationItem(
            title: 'L1000 scale need to be calibrated',
            content: "Follow the Operation Manual and calibrate L1000",
            icon: Icons.add_alert,
            date: '9th October 2020',
          ),
          SizedBox(height: 20,),
          NotificationItem(
            title: 'F200 scale need new spare part',
            content: "Find spare and install into the F200",
            icon: Icons.notifications_active_outlined,
            date: '8th October 2020',
          ),
        ],
      ),
    );
  }
}
