import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proevent/component/add_event_page.dart';
import 'package:proevent/component/mybutton.dart';
import '../../../../component/textutils.dart';
import '../../../data/services/theme.dart';
import '../controllers/events_controller.dart';

class EventsView extends StatelessWidget {
  final EventsController controller = Get.put(EventsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple.shade100,
      body: Column(
        children: [
          _addEvent(),
          _addDateBar(),
          SizedBox(height: 30,),
          Expanded(
            child: Obx(
                  () => GridView.builder(
                itemCount: controller.eventList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  print(controller.eventList[index].image);
                  return BuildCardItems(
                    image: controller.eventList[index].image,
                    rate: controller.eventList[index].rate,
                    eventId: controller.eventList[index].id,
                    name: controller.eventList[index].name
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addDateBar() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Color(0xFF9BBBFC),
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        onDateChange: (date) {
          controller.onDateChange(date);
        },
      ),
    );
  }

  Widget _addEvent() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                      () => Text(
                    controller.formattedDate,
                    style: subHeadingStyle,
                  ),
                ),
                Text(
                  "Today",
                  style: HeadingStyle,
                ),
              ],
            ),
          ),
          MyButton(
            label: " Create ",
            onTap: () => Get.to(AddEventPage()),
          ),
        ],
      ),
    );
  }
}

Widget BuildCardItems({
  required String image,
  required double rate,
  required eventId,
  required name ,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {

                },
                icon: Icon(
                  CupertinoIcons.square_favorites,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                showUsernameModificationDialog();
                },
                icon: Icon(
                  CupertinoIcons.location_fill,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          // Image container
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              children: [
                Text(

                 name,
                  style: TextStyle(
                    color: Colors.black,

                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Container(
                  height: 20,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextUtils(
                        text: "$rate",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                      Icon(CupertinoIcons.star, size: 12, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}