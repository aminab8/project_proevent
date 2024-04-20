import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proevent/app/data/model/notifications.dart';

import 'package:proevent/component/mybutton.dart';

import '../app/data/services/theme.dart';

import 'myinputfield.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}


class _AddEventPageState extends State<AddEventPage>{
  final Notifications _notificationsController = Get.put(Notifications());
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _placecontroller = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _selectedType = "Séminaires";
  List<String> typelist = [
    "Réunions",
    "Soirée de gala",
    " Conférence",
  ];
  String _selectedDepartment = "Department mobile";
  List<String> deptlist =[
    "Department mobile",
    "Department web",
    " entreprise",
  ];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        leading: GestureDetector(
          onTap: (){

            Get.back();
          },
          child: Icon(CupertinoIcons.back,
            size: 20,
            color: Get.isDarkMode ? Colors.white:Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Add Event",style: HeadingStyle,),
              MyInputField(title: "Name", hint: "Enter  your name of the event",controller: _namecontroller,),
              MyInputField(title: "Name of department", hint: "$_selectedDepartment",
                widget:DropdownButton(
                  icon: Icon(CupertinoIcons.down_arrow,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: SubtitleStyle,
                  underline: Container(height: 0,),
                  items: deptlist.map<DropdownMenuItem<String>>((String  value){
                    return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString())
                    );
                  }
                  ).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDepartment = newValue!;
                    });
                  },

                ),
              ),
              MyInputField(title: "Place", hint: "Enter  your place",controller: _placecontroller,),
              MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(CupertinoIcons.calendar),
                  onPressed: (){
                    _getDateFromUser();
                  },
                ) ,
              ),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                        title: "Start Time",
                        hint: _startTime,
                        widget: IconButton(
                          onPressed: (){
                            _getTimeFromUser(isStartTime: true);
                          },
                          icon: Icon(
                            CupertinoIcons.time,
                            color: Colors.grey,
                          ),
                        ),
                      )
                  ),
                  SizedBox(width: 11) ,
                  Expanded(
                      child: MyInputField(
                        title: "End Time",
                        hint: _endTime,
                        widget: IconButton(
                          onPressed: (){
                            _getTimeFromUser(isStartTime: false);
                          },
                          icon: Icon(
                            CupertinoIcons.time,
                            color: Colors.grey,
                          ),
                        ),
                      )
                  ),
                ],
              ),
              MyInputField(title: "Type" , hint: " $_selectedType",
                widget:DropdownButton(
                  icon: Icon(CupertinoIcons.down_arrow,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: SubtitleStyle,
                  underline: Container(height: 0,),
                  items: typelist.map<DropdownMenuItem<String>>((String  value){
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                        child: Text(value.toString())
                    );
                  }
                  ).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedType = newValue!;
                    });
                  },

                ),
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPallete(),
                  MyButton(label: "create event", onTap:()=> _validateDate()),
                ],
              ),


            ],
          ),


          ),
        ),

    );

  }
  _validateDate(){
    if(_namecontroller.text.isNotEmpty && _placecontroller.text.isNotEmpty){
      _addEventToDb();
      Get.back();
    }else if (_namecontroller.text.isNotEmpty || _placecontroller.text.isNotEmpty ){
      Get.snackbar("Required", "All fields are required ! ",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.deepPurple,
        icon: Icon(CupertinoIcons.rectangle_fill,color: Colors.red,),
      );

    }

  }
  _getDateFromUser() async{
    DateTime? pickerDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2015),
        lastDate: DateTime(2030),
    );
    if( pickerDate!=null){
      setState(() {
        _selectedDate = pickerDate;
        print(_selectedDate);
      });

    }else{
      print("it ' s null or something is wrong");
    }
  }
  _getTimeFromUser({ required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime =pickedTime.format(context);
    if(pickedTime==null){
      print("Time canceld");
    }else if (isStartTime==true){
      setState(() {
    _startTime = _formatedTime;
      });
    }else if (isStartTime==false){
      setState(() {
      _endTime = _formatedTime;
      });

    }

    _showTimePicker();
  }
  _showTimePicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        )
    );
  }
  _addEventToDb() async{

    int value = await _notificationsController.addevent(
      notifications : Notifications(

        name: _namecontroller.text,
        place: _placecontroller.text,
        date: DateFormat.yMd().format(_selectedDate),
        startTime: _startTime,
        endTime: _endTime,
        color: _selectedColor,
        isCompleted: 0,
        type: _selectedType,
        namedept: _selectedDepartment,


      )
  );
  print("my id is "+"$value");
  }
  _colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children :[
        Text("Color",
          style: titleStyle,
        ),
        SizedBox(height: 8.0,),
        Wrap(
            children: List<Widget>.generate(
                3,
                    (int index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        _selectedColor = index;
                        print("$index");
                      });
                    },
                    child : Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: index==0?primaryClr:index==1? Colors.pink : Colors.yellow,
                        child: _selectedColor==index? Icon( CupertinoIcons.check_mark,
                          color: Colors.white,
                          size: 16,
                        ): Container(),
                      ),
                    ),
                  );
                }
            )
        ),

      ],
    );
  }



}
