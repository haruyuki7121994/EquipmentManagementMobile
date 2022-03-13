import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appqrcode/main_page.dart';
import 'package:appqrcode/login.dart';

import '../home.dart';
import '../home_cubit.dart';

checkRole(BuildContext context)async{
  final sharedPreferences = await SharedPreferences.getInstance();
  final role = sharedPreferences.getString('roles');

  if(role == '[ROLE_GUEST]'){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('You do not have this permission'),
        content: const Text('Please log in with role Maintainer'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return BlocProvider(
                create: (_) => HomeCubit(),
                child: HomePage(),
              );
            })),
            child: const Text('Go back'),
          ),
          TextButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
            child: const Text('Login'),
          ),
        ],
      ),
    );

  }
}