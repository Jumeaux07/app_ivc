import 'dart:convert';

import 'package:ivc/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserModel {
  int? id;
  String? nom;
  String? prenoms;
  String? phone;
  String? username;
  String? nomAtelier;

  static UserModel? sessionUser;

  UserModel({this.id, this.nom, this.prenoms, this.phone, this.username, this.nomAtelier});

  factory UserModel.fromJson(Map<String, dynamic> j){
    return UserModel(
      id: j['id'],
      nom: j['nom'],
      prenoms: j['prenoms'],
      phone: j['phone'],
      username: j['username'],
      nomAtelier: j['nomAtelier'],
    );
  }

  Map<String, dynamic> toMap()=>{
    'id':id,
    'nom':nom,
    'prenoms':prenoms,
    'phone':phone,
    'username':username,
    'nomAtelier':nomAtelier,
  };

  //Get User data 
  static getUser()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getString("user");
    if(data != ""){
      var decod = jsonDecode(data!);
      var user = UserModel.fromJson(decod);
      sessionUser = user;
    }
    if(data == ""){
      sessionUser = null;
    }
  }

// logout User
  static void logout()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("token");
  }
}