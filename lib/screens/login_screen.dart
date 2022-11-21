import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ivc/components/background.dart';
import 'package:ivc/constants.dart';
import 'package:ivc/models/api_response.dart';
import 'package:ivc/screens/home_screen.dart';
import 'package:ivc/screens/register_screen.dart';
import 'package:ivc/services/users_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
GlobalKey<FormState> key = GlobalKey<FormState>();
TextEditingController usernameText = TextEditingController();
TextEditingController passwordText = TextEditingController();
  bool _loading = false;
  bool _value = false;
  //Verification internet
  void _isInternet2()async {
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
//Fonction connexion
void _login(String email, String passord)async{
  setState(() {
  _loading = true;
  });
  ApiResponse apiResponse = await loginUser(email,passord);
  if (apiResponse.token != null) {
    // Redirection sur la page Home
    setState(() {
    _loading = false;
    });
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${apiResponse.message}'),
        backgroundColor: vert,
      )
    );
  }else{
    //Affichage du message d'Erreur et page de connexion
    setState(() {
    _loading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${apiResponse.erreur}'),
        backgroundColor: Colors.red
      )
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(content: Center(
      child: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(children: [
            //LOGO
            Icon(Icons.person, color: orange, size: 200,),
            //Text
            Text("Connexion", style: TextStyle(fontSize: 45),),
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
            //Input Email
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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Checkbox(value: _value, onChanged: (value){
                      setState(() {
                        _value = value!;
                      });
                    },
                    activeColor: vert,),
                    Text("Afficher le mot de passe")
                  ],
                ),
              ),
              // ---Bouton---
              GestureDetector(
                onTap: (){
                  if(key.currentState!.validate()){
                    setState(() {
                      _loading = true;
                    });
                    _isInternet2();
                    print("-------------Connexion en cours---------");
                    _login(usernameText.text,passwordText.text);
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
                      Text("Connexion", style: TextStyle(color: blanc, fontSize: 20),)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vous n'avez pas de compte? "),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context)=> RegisterScreen()),
                      (route) => false
                    ),
                    child: Text("Créez un compte", style: TextStyle(fontWeight: FontWeight.bold),)
                  ),
                ],
              ),
          ],),
        ),
      ),
        )
      ),
    );
  }
}