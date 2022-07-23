import 'package:flutter/material.dart';
import 'package:ivc/constants.dart';

class Background extends StatelessWidget {
  final Widget content;
  const Background({ Key? key, required this.content }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: blanc,
      image: DecorationImage(image: AssetImage(font),
      fit: BoxFit.cover,colorFilter: ColorFilter.mode(blanc.withOpacity(0.10), BlendMode.dstATop),
      )
      ),
      child: Center(
        child:SingleChildScrollView(child: this.content,)
      ),
    );
  }
}