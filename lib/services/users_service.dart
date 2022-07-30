import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivc/constants.dart';
import 'package:ivc/models/api_response.dart';
import 'package:ivc/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ApiResponse>loginUser(String email, String password)async{
  ApiResponse apiResponse = ApiResponse();
  SharedPreferences pref = await SharedPreferences.getInstance();
  try {
    final response = await http.post(Uri.parse(loginUrl), 
      headers: {"accept":"application/json"},
      body: {"email": email, "password": password}
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