import 'package:flutter/material.dart';
import 'package:ivc/constants.dart';
import 'package:ivc/screens/list_order_screen.dart';
import 'package:ivc/screens/new_order_screen.dart';
import 'package:ivc/screens/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({ Key? key }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            SizedBox(height: 5,),
            //App bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage(logo))
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>SettingsScreen())
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Icon(Icons.settings, color:Colors.deepOrange)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:30),
            //Commande Restantes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("AKWABA", style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                    )
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 4.0,
              color: Colors.blueGrey[900],
              indent: 20.0,
              endIndent: 280.0,
            ),
            // Image Atelier
            Row(
              children:[
                Expanded(child: Image.asset(fashion_designer))
              ]
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>NewOrderScreen())
                      );
                      print("Nouvelle commande");
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color:Colors.blueGrey[900],
                          ),
                          width: 120,
                          height: 120,
                          child: Image.asset(btnCmd),
                        ),
                        Text("Nouveaux")
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>ListOrderScreen())
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color:Colors.blueGrey[900],
                          ),
                          width: 120,
                          height: 120,
                          child: Image.asset(btnList),
                        ),
                      ),
                      Text("Commandes")
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
  }
}