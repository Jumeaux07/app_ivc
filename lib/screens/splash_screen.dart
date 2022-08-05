import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ivc/components/background.dart';
import 'package:ivc/constants.dart';
import 'package:ivc/screens/home_screen.dart';
import 'package:ivc/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
bool isFirst = true;
bool islogged = false;

class _SplashScreenState extends State<SplashScreen> {
  Future<void>isToken()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token =  pref.get("token");
    if(token != null){
      print(token);
      setState(() {
        islogged = true;
      });
    }else{
      print(token);
      setState(() {
        islogged = false;
      });
    }
  }
  Future<Timer> loadData()async{
    return new Timer(Duration(seconds: 4), nextPage);
  }
  nextPage(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context)=> islogged? HomeScreen():LoginScreen())
    );
  }
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    isToken();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Background(
      content: Center(child: Column(
        children: [
          AnimatedCrossFade(
            firstChild: Image.asset(logo), 
            secondChild: Image.asset(btnCmd), 
            crossFadeState: isFirst?CrossFadeState.showFirst:CrossFadeState.showSecond, 
            duration: Duration(milliseconds: 3500)
          ),
        ],
      )),
    );
  }
}