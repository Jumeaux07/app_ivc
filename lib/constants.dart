  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
// ---------------------END POINTS------------------
const baseUrl = 'http://192.168.43.24:8000/api/';
const loginUrl = baseUrl+'login_user';
const registerUrl = baseUrl+'users';

// --------------------COLORS------------------
  const orange = Color(0xFFF37423);
  const vert = Color(0xFF109447);
  const blanc = Color(0xFFFFFFFF);
  const orangeFonce = Color(0xFFBA5015);
  const grisClair = Color(0xFFC0C0C0);
  const noir = Color(0xFF000000);

// ---------------------IMAGES LOGOS---------------
  final font = "assets/images/font-img.png";
  final tissu = "assets/images/font-img-tissu.png";
  final trait = "assets/images/font-img-trait.png";
  final btnCmd = "assets/images/btn_cmd.png";
  final btnList = "assets/images/btn_list.png";
  final logo = "assets/images/logo.png";

//-----------------------ICONS------------------------
  const home_icon =  "assets/icons/home.png";
  const mannequin_icon =  "assets/icons/mannequin.png";
  const orders_icon =  "assets/icons/my_orders.png";
  const new_order_icon =  "assets/icons/new_order.png";
  const task_icon =  "assets/icons/task.png";
  const user_icon =  "assets/icons/user.png";
  const clothes_shop_icon =  "assets/icons/clothes-shop.png";
  const fashion_design =  "assets/icons/fashion-design.png";
  const fashion_designer =  "assets/icons/fashion-designer.png";

  // ---------------------ERREUR---------------
  const noInternet = "Verfiez votre connexion internet";
  const badRequest = "Mauvaise requête";