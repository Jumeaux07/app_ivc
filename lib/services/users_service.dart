import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivc/constants.dart';
import 'package:ivc/models/api_response.dart';
import 'package:ivc/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Login Function
Future<ApiResponse>loginUser(String username, String password)async{
  ApiResponse apiResponse = ApiResponse();
  SharedPreferences pref = await SharedPreferences.getInstance();
  try {
    final response = await http.post(Uri.parse(loginUrl), 
      headers: {"accept":"application/json"},
      body: {"username": username, "password": password}
      );
      if(response.statusCode == 200){
        final data = UserModel.fromJson(jsonDecode(response.body)['user']);
        final token = jsonDecode(response.body)['token'];
        final message = jsonDecode(response.body)['message'];
        apiResponse.data = data;
        apiResponse.token = token;
        apiResponse.message = message;
        final dat = data.toMap();
        final user = jsonEncode(dat);
        pref.setString('user', user);
        pref.setString('token', token);
        print(message);
        print("connecté");
      }else{
        apiResponse.erreur = jsonDecode(response.body)['message'];
        print(apiResponse.erreur);
      }
  } catch (e) {
        apiResponse.erreur = e.toString();
        print(apiResponse.erreur);
  }

  return apiResponse;
}

//Register Function
Future<ApiResponse>registerUser(String username, String password, String passwordConfirmation)async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(registerUrl),
    headers: {"accept":"application/json"},
    body: {"username":username, "password":password, "password_confirmation":passwordConfirmation}
    );
    if (response.statusCode == 201){
      final data = UserModel.fromJson(jsonDecode(response.body)['user']);
      final token = jsonDecode(response.body)['token'];
      final message = jsonDecode(response.body)['message'];
      apiResponse.message = message;
      apiResponse.token = token;
      apiResponse.data = UserModel.fromJson(jsonDecode(response.body)['user']);

      final user = jsonEncode(data.toMap());

      await pref.setString("user", user);
      await pref.setString("token", token);
      print(message);
      print(token);
      print(user);
    }else{
      // final erreur = jsonDecode(response.body)['message'];
      final exception = jsonDecode(response.body)['Exception'];
      apiResponse.erreur = exception.toString();
      print("invalide");
      print(exception);
    }
  } catch (e) {
    apiResponse.erreur = e.toString();
    print(e);
  }
  return apiResponse;
}

// Get User Info Function
