import 'package:flutter/material.dart';
import 'package:ivc/constants.dart';
import 'package:ivc/screens/new_order_screen.dart';

class GenreScreen extends StatefulWidget {
  GenreScreen({ Key? key }) : super(key: key);

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
   List<Widget> _items = [];

  @override
  Widget build(BuildContext context) {
    // return  MaterialApp(
    //   home: Scaffold(
    //     body: Column(
    //       children: <Widget>[
    //         Expanded(
    //           child: ListView.builder(
    //             itemCount: _items.length,
    //             itemBuilder: (context, index) {
    //               return _items[index];
    //             },
    //           ),
    //         ),
    //         InkWell(
    //           child: Container(
    //             padding: EdgeInsets.all(12.0),
    //             child: Text("Add Item"),
    //           ),
    //           onTap: () {
    //             setState(() {
    //               _items.add(TextField(
                    
    //               ));
    //             });
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (() {
              Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>NewOrderScreen(genre: 'H',))
              );
            }),
            child: Row(
              children: [
                Expanded(child: Image.asset(homme_genre_icon, height: 300,) ) 
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>NewOrderScreen(genre: 'F',))
              );
            },
            child: Row(
              children: [
                Expanded(child: Image.asset(femme_genre_icon, height: 300,) ) 
              ],
            ),
          ),
            ],
          )
    );
  }
}