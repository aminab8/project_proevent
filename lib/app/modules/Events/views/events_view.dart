import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:proevent/component/add_event_page.dart';
import 'package:proevent/component/mybutton.dart';
import '../../../data/services/theme.dart';



class EventsView extends StatelessWidget {
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          _addEvent(),
          _addDateBar(),
          SizedBox(height: 200),
          Lottie.asset('assets/animation/calendar.json',
            height: 200,
            reverse: true,
            repeat: true,
            fit: BoxFit.cover,
          ),

    ],


    ),

    );
  }
  _addDateBar(){
    return  Container(
      margin: EdgeInsets.only(top: 20,left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Color(0xFF9BBBFC),
        selectedTextColor: Colors.white,
        dateTextStyle:GoogleFonts.lato(
          textStyle:  TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        dayTextStyle:GoogleFonts.lato(
          textStyle:  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        monthTextStyle:GoogleFonts.lato(
          textStyle:  TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        onDateChange: (date){
          _selectedDay =date ;
        },
      ),
    );
  }
  _addEvent(){
    return  Container(
      margin:  const EdgeInsets.only(left: 20,right: 20,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children : [
                Text( DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text("Today", style: HeadingStyle,),

              ],

            ),
          ),
          MyButton(label: " Create ",

              onTap: ()=> Get.to(AddEventPage())),
        ],
      ),


    );

  }

}



