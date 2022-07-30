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
TextEditingController emailText = TextEditingController();
TextEditingController passwordText = TextEditingController();
  bool _loading = false;
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
                  controller: emailText,
                  validator: (value) => value!.isEmpty?"Champ obligatoire":null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 25),
                    hintText: "cedric@gmail.com",
                    hintStyle: TextStyle(fontSize: 15),
                  ),
                )
              ),
            //Input Email
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordText,
                  validator: (value) => value!.isEmpty?"Champ obligatoire":null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize: 25),
                    hintText: "xxxxxxxxx",
                    hintStyle: TextStyle(fontSize: 15),
                  ),
                )
              ),
              SizedBox(height: 20,),
              // ---Bouton---
              GestureDetector(
                onTap: (){
                  if(key.currentState!.validate()){
                    setState(() {
                      _loading = true;
                    });
                    print("-------------Connexion en cours---------");
                    _login(emailText.text,passwordText.text);
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