import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'MaintenanceCalendar.dart';
import 'components/notification_list.dart';
import 'home_cubit.dart';
import 'main_page.dart';
import 'profile.dart';
import 'qrcode_page.dart';
import 'notification_page.dart';
import 'size_config.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<HomeCubit, int>(
      builder: (_, state) {
        return WillPopScope(
          onWillPop: () async {
            navigatorKey.currentState?.maybePop();
            return false;
          },
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                _changeBottomNav(_, index);
              },
              currentIndex: state,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.qr_code,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_sharp,
                  ),
                  label: "",
                ),
        ],
            ),
            body: _buildBody(state),
          ),
        );
      },
    );
  }

  void _changeBottomNav(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.read<HomeCubit>().getMain();
        break;
      case 1:
        context.read<HomeCubit>().getCalendar();
        break;
      case 2:
        context.read<HomeCubit>().getQrcode();
        break;

      case 3:
        context.read<HomeCubit>().getNotification();
        break;
      case 4:
        context.read<HomeCubit>().getMore();
        break;
    }
  }

  Widget _buildBody(index) {
    switch (index) {
      case 0:
        return MainPage();
      case 1:
        return MaintenanceCalendar();
      case 2:
        return QrcodePage();
      case 3:
        return NotificationPage();
      case 4:
        return Profile();
    }
    return MainPage();
  }
}






