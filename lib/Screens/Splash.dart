
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loginapp/Screens/Homepage.dart';
import 'package:loginapp/Screens/Login.dart';
import 'package:loginapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen_Splash extends StatefulWidget {
  const Screen_Splash({super.key});

  @override
  State<Screen_Splash> createState() => _Screen_SplashState();
}

class _Screen_SplashState extends State<Screen_Splash> {

  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.android_rounded,color: Colors.indigo,size: 150,),
          
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text('WELCOME',style:TextStyle(fontSize: 25,fontWeight: FontWeight.w800,letterSpacing: 10),),
          )
        ],
      ))),
    );
  }

  Future<void> goToLogin() async{
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Screen_Login()));
  }

  Future<void> checkUserLoggedIn() async{
    final _sharedPrefs= await SharedPreferences.getInstance();
    final _userLoggedIn=_sharedPrefs.getBool(SAVE_KEY);
    if(_userLoggedIn==null || _userLoggedIn==false){
      goToLogin();
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((ctx) => Homepage())));
    }
  }
}