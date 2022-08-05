import 'package:flutter/material.dart';

class ItemSettings extends StatelessWidget {
  const ItemSettings({ Key? key, required this.icon, required this.tilte }) : super(key: key);
  final String icon;
  final String tilte;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Icon and text
        Container(
          child: Row(
            children: [
              Image.asset(
              this.icon,width: 20,
              height: 20,
              color: Colors.deepOrange
            ),
            Text(this.tilte, style:TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
            ],
          ),
        ),
        //Icon Forward
        Icon(Icons.arrow_forward_ios)
      ],
    );
  }
}