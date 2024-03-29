import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ivc/constants.dart';
import 'package:ivc/screens/home_screen.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({ Key? key, required this.genre }) : super(key: key);
  final String genre;
  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

  String?_imageClient;

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController nomClient = TextEditingController();
  TextEditingController phoneClient = TextEditingController();
  TextEditingController lieuClient = TextEditingController();



class _NewOrderScreenState extends State<NewOrderScreen> {
  void _photoClient() async {
    final _imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(_imageFile != null){
      setState(() {
        _imageClient = _imageFile.path;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _photoClient();
          // ignore: unnecessary_null_comparison
          _imageClient == null? print('image') : print(_imageClient);
        },
        child: Image.asset(camera_1_icon, width: 40,),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children:[ Form(
              key: key,
              child: Column(
                children: [
                  SizedBox(height:20),
                  // AppBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("INFO CLIENT", style:TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 80,),
                  // Image Add user
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      GestureDetector(
                        onTap:(){
                          _photoClient();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1), 
                              left: BorderSide(width: 1), 
                              right: BorderSide(width: 1),
                              bottom: BorderSide(width: 1)
                            ),
                          ),
                          child: _imageClient == null ? 
                            Image.asset(camera_icon, width: 150, color: orangeFonce,):
                            Image.file(File(_imageClient!),width: 150, height: 150,fit: BoxFit.cover, )
                        ),
                      ),
                    ]
                  ),
                  SizedBox(height:30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) => value!.isEmpty?"Champ obligatoire":null,
                          controller: nomClient,
                          decoration: InputDecoration(
                            labelText:"Nom complet",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) => value!.isEmpty?"Champ obligatoire":null,
                          controller: phoneClient,
                          decoration: InputDecoration(
                            labelText:"Téléphone",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                            prefixText: "+225 "
                          ),
                        ),
                        TextFormField(
                          validator: (value) => value!.isEmpty?"Champ obligatoire":null,
                          controller: lieuClient,
                          decoration: InputDecoration(
                            labelText:"Adresse",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                        ),
                        SizedBox(height:20),
                        TextButton.icon(onPressed: (){
                            if(key.currentState!.validate()){
                              print("Suivant");
                            }
                        }, 
                          icon: Icon(Icons.arrow_forward_ios), 
                          label: Text("Suivant", style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}