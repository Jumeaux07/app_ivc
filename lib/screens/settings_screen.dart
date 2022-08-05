import 'package:flutter/material.dart';
import 'package:ivc/components/item_settings.dart';
import 'package:ivc/constants.dart';
import 'package:ivc/models/user_model.dart';
import 'package:ivc/screens/home_screen.dart';
import 'package:ivc/screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({ Key? key }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children:[
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false
                      );
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Text("Retour", style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Text("Paramètres", style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              //Premier Bloc (compte)
              Container(
                child: Row(
                  children: [
                    Text("PARAMETRES DU COMPTE", style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
              //Block of Settings
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:Colors.grey.shade300,
                              offset: Offset(-2,4),
                              spreadRadius: 2.0,
                              blurRadius: 2.0
                            )
                          ]
                        ),
                        child:Column(
                          children: [
                            //Items
                            ItemSettings(icon: user_1_icon, tilte: "  Compte"),
                            Divider(),
                            //Items
                            ItemSettings(icon: notify_icon, tilte: "  Notifications"),
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              //Bloc of Security settings
              Container(
                child: Row(
                  children: [
                    Text("SECURITE", style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
              //Block of Settings
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:Colors.grey.shade300,
                              offset: Offset(-2,4),
                              spreadRadius: 2.0,
                              blurRadius: 2.0
                            )
                          ]
                        ),
                        child:Column(
                          children: [
                            //Items
                            ItemSettings(icon: password_icon, tilte: "  Connexion & mot de passe"),
                            Divider(),
                            //Items
                            ItemSettings(icon: security_icon, tilte: "  Authentifications"),
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
              //Bloc of Security settings
              Container(
                child: Row(
                  children: [
                    Text("REPONSE", style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
              //Block of Settings
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:Colors.grey.shade300,
                              offset: Offset(-2,4),
                              spreadRadius: 2.0,
                              blurRadius: 2.0
                            )
                          ]
                        ),
                        child:Column(
                          children: [
                            //Items
                            ItemSettings(icon: phone_icon, tilte: "  Contactez-nous"),
                            Divider(),
                            //Items
                            ItemSettings(icon: help_icon, tilte: "  A propos"),
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
              //Bloc of Security settings
              Container(
                child: Row(
                  children: [
                    Text("AUTRES ACTIONS", style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
              //Block of Settings
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          UserModel.logout();
                          print("Logout");
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color:Colors.grey.shade300,
                                offset: Offset(-2,4),
                                spreadRadius: 2.0,
                                blurRadius: 2.0
                              )
                            ]
                          ),
                          child:Column(
                            children: [
                              //Items
                              ItemSettings(icon: logout_icon, tilte: "  Déconnexion"),
                            ],
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}