import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proevent/app/data/services/theme.dart';

class MyInputField extends StatelessWidget{
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final String? Function(String?)? validator;

  const MyInputField({ Key? key , required this.title,required this.hint, this.controller, this.widget, this.validator,}) : super(key : key);

  @override
  Widget build(BuildContext context) {
   return Container(
     margin: const  EdgeInsets.only(top: 16),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(title,style: titleStyle,
         ),
         Container(
           height: 52,
           margin: EdgeInsets.only(top: 8.0),
           padding: EdgeInsets.only(left: 14),
           decoration: BoxDecoration(
             border: Border.all(
               color: Colors.grey,
               width: 1.0,
             ),
             borderRadius: BorderRadius.circular(12),
           ),
           child: Row(
             children: [
               Expanded(child: TextFormField(
                 readOnly: widget==null?false:true,
                 autofocus: false,
                 cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                 controller: controller,
                 style: SubtitleStyle,
                 decoration: InputDecoration(
                   hintText: hint,

                   hintStyle: SubtitleStyle,
                   focusedBorder: UnderlineInputBorder(
                     borderSide: BorderSide(

                       width: 0,
                     )
                   ),
                   enabledBorder: UnderlineInputBorder(
                       borderSide: BorderSide(

                         width: 0,
                       )
                   ),
                 ),
                   validator : (value){
                     if(value==null || value.isEmpty){
                       return " tu dois compléter ce texte";
                     }
                     return null;
                   }
           ),
         ),
               widget==null?Container():Container(child: widget,)
             ],
           ),
         ),
       ],
     ),
   );

  }

}