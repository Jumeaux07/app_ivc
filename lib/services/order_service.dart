import 'dart:convert';

import 'package:ivc/constants.dart';
import 'package:ivc/models/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<void> getOrder()async{
  SharedPreferences pref = await SharedPreferences.getInstance();

  try {
    final response = await http.get(
      Uri.parse(orderUrl),
      headers: {"accept": "application/json"}
    );
    if(response.statusCode == 200){
      final data = OrderModel.fromJson(jsonDecode(response.body)['commandes']);
      print(data);
    }else{
      print("Order erreur");
    }
  } catch (e) {
    print("Exception"+e.toString());
  }
}