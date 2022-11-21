import 'package:flutter/material.dart';
import 'package:ivc/components/background.dart';
import 'package:ivc/constants.dart';
import 'package:ivc/models/api_response.dart';
import 'package:ivc/screens/home_screen.dart';
import 'package:ivc/screens/login_screen.dart';
import 'package:ivc/services/users_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
bool _loading = false;
TextEditingController usernameText = TextEditingController();
TextEditingController passwordText = TextEditingController();
TextEditingController confirmationText = TextEditingController();
GlobalKey<FormState> key = GlobalKey<FormState>();
bool _value = false;
class _RegisterScreenState extends State<RegisterScreen> {
  
  void _register(String username, String password, String passwordConfirmation)async{
    ApiResponse apiResponse = await registerUser(username, password, passwordConfirmation);
    if(apiResponse.token != null){
      setState((){
        _loading = false;
      });
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=> HomeScreen()), (route) => false
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${apiResponse.message}'), backgroundColor: vert)
      );
    }else{
      setState(() {
        _loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${apiResponse.erreur}'), backgroundColor:Colors.red)
      );
    }
  }

  void isInternet()async{
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none){
      setState(() {
        _loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(noInternet),
          backgroundColor: Colors.red,
        )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        content: Form(
          key: key,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //LOGO
                  Icon(Icons.person_add_alt, color: orange, size: 150,),
                  //Text
                  Text("Inscription", style: TextStyle(fontSize: 45),),
                  SizedBox(height: 20,),
                  //Input Email
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        controller: usernameText,
                        validator: (value) => value!.isEmpty?"Champ obligatoire":null,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: "Téléphone",
                          labelStyle: TextStyle(fontSize: 25),
                          hintText: "0102030405",
                          hintStyle: TextStyle(fontSize: 15),
                        ),
                      )
                    ),
                  //Input password
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        obscureText: !_value,
                        controller: passwordText,
                        validator: (value) => value!.isEmpty?"Champ obligatoire":null,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_open_outlined),
                          labelText: "Mot de passe",
                          labelStyle: TextStyle(fontSize: 25),
                          hintText: "xxxxxxxxx",
                          hintStyle: TextStyle(fontSize: 15),
                        ),
                      )
                    ),
                  //Input Confirmation password
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        obscureText: !_value,
                        controller: confirmationText,
                        validator: (value) => value!.isEmpty?"Champ obligatoire":null,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_open_outlined),
                          labelText: "Confirmation",
                          labelStyle: TextStyle(fontSize: 25),
                          hintText: "xxxxxxxxx",
                          hintStyle: TextStyle(fontSize: 15),
                        ),
                      )
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _value,
                                onChanged: (value){
                                setState(() {
                                  _value = value!;
                                });
                              },
                              activeColor: vert,
                              
                            ),
                            Text("Afficher le mot de passe")
                          ],
                        ),
                    ),
                    // ---Bouton---
                    GestureDetector(
                      onTap: (){
                        if(key.currentState!.validate()){
                          if(confirmationText.text != passwordText.text){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Les mots de passe ne correspondent pas"),
                                backgroundColor:Colors.red
                              )
                            );
                          }else{
                            setState(() {
                              _loading = true;
                            });
                            isInternet();
                            print("-------------Inscription en cours---------");
                            print("phone"+usernameText.text);
                            print("pass"+passwordText.text);
                            print("pass@"+confirmationText.text);
                            _register(usernameText.text, passwordText.text, confirmationText.text);
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), 
                          color: vert
                          ),
                          child: Center(
                            child: _loading?
                            CircularProgressIndicator(color: blanc, strokeWidth: 1.2, ):
                            Text("Valider", style: TextStyle(color: blanc, fontSize: 20),)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Vous avez un compte? "),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context)=> LoginScreen()),
                            (route) => false
                          ),
                          child: Text("Connectez-vous", style: TextStyle(fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        )
      ),
      );
  }
}