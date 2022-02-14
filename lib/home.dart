import "package:appqrcode/bottomNavigation.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_cubit.dart';
import 'main_page.dart';
import 'more_page.dart';
import 'qrcode_page.dart';
import 'history_page.dart';
import 'notification_page.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
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
                    Icons.history,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_sharp,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
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
        context.read<HomeCubit>().getQrcode();
        break;
      case 2:
        context.read<HomeCubit>().getHistory();
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
        return QrcodePage();
      case 2:
        return HistoryPage();
      case 3:
        return MorePage();
      case 4:
        return NotificationPage();
    }
    return MainPage();
  }
}






