import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ivc/components/background.dart';
import 'package:ivc/constants.dart';
import 'package:ivc/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
bool isFirst = true;

class _SplashScreenState extends State<SplashScreen> {
  Future<Timer> loadData()async{
    return new Timer(Duration(seconds: 6), nextPage);
  }
  nextPage(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context)=>LoginScreen())
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Background(
      content: Center(child: Column(
        children: [
          AnimatedCrossFade(
            firstChild: Image.asset(logo), 
            secondChild: Image.asset(logo), 
            crossFadeState: isFirst?CrossFadeState.showFirst:CrossFadeState.showSecond, 
            duration: Duration(milliseconds: 1000)
          ),
          CircularProgressIndicator(color: vert,),
        ],
      )),
    );
  }
}