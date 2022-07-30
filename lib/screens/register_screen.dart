import 'package:flutter/material.dart';
import 'package:ivc/components/background.dart';
import 'package:ivc/constants.dart';
import 'package:ivc/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
bool _loading = false;
TextEditingController emailText = TextEditingController();
TextEditingController passwordText = TextEditingController();
TextEditingController confirmationText = TextEditingController();
GlobalKey<FormState> key = GlobalKey<FormState>();
class _RegisterScreenState extends State<RegisterScreen> {

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
                  //Input password
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
                  //Input Confirmation password
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        obscureText: true,
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
                    SizedBox(height: 20,),
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
                            print("-------------Inscription en cours---------");
                            // _register(emailText.text,passwordText.text);
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