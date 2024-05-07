import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proevent/app/data/services/theme.dart';

class MyButton extends StatelessWidget{
  final String label ;
  final Function()? onTap;
  const MyButton({Key ? key, required this.label,required this.onTap}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child : Container(
      width : 80,
      height : 40,
      decoration : BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF9BBBFC),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,

        ),
      ),
      ),
    );
  }

}