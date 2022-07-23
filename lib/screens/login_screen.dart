import 'package:flutter/material.dart';
import 'package:ivc/components/background.dart';
import 'package:ivc/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Background(content: Center(
      child: SingleChildScrollView(
        child: Column(children: [
          //LOGO
          Icon(Icons.person, color: orange, size: 250,),
          //Text
          Text("Connexion", style: TextStyle(fontSize: 45),),
          //Input Email
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.email), labelText: "Email",
            labelStyle: TextStyle(fontSize: 25),
            hintText: "cedric@gmail.com",
            hintStyle: TextStyle(fontSize: 15),
                ),
              )
            ),
          //Input Email
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.lock), labelText: "Mot de passe",
            labelStyle: TextStyle(fontSize: 25),
            hintText: "xxxxxx",
            hintStyle: TextStyle(fontSize: 15),
                ),
              )
            ),
            // ---Bouton---
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: vert),
                child: Center(
                  child: Text("Connexion", style: TextStyle(color: blanc, fontSize: 25),)
                  ),
              ),
            ),
        ],),
      ),
        )
      ),
    );
  }
}