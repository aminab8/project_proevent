import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proevent/component/mybutton.dart';
import '../app/data/model/formateur.dart';
import '../app/data/model/session.dart';
import '../app/data/services/databaseservice.dart';
import '../app/data/services/notifications.dart';
import '../app/data/services/theme.dart';
import '../app/modules/Notification/controllers/notification_controller.dart';
import 'myinputfield.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final Notifications _notificationsController = Get.put(Notifications());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _sessionNameController = TextEditingController();
  final TextEditingController _sessionNumberController = TextEditingController();
  final TextEditingController _formateurNameController = TextEditingController();
  final TextEditingController _formateurEmailController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _selectedType = "Séminaires";
  List<String> typelist = [
    "Réunions",
    "Soirée de gala",
    "Conférence",
    "Formation",
  ];
  String _selectedDepartment = "Department mobile";
  List<String> deptlist = [
    "Department mobile",
    "Department web",
    "Entreprise",
  ];
  int _selectedColor = 0;
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple.shade100,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            CupertinoIcons.back,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Event",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              MyInputField(
                title: "Name",
                hint: "Enter the name of the event",
                controller: _nameController,
              ),
              MyInputField(
                title: "Name of department",
                hint: "$_selectedDepartment",
                widget: DropdownButton(
                  icon: Icon(
                    CupertinoIcons.down_arrow,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: SubtitleStyle,
                  underline: Container(height: 0),
                  items: deptlist.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDepartment = newValue!;
                    });
                  },
                ),
              ),
              MyInputField(
                title: "Place",
                hint: "Enter the place",
                controller: _placeController,
              ),
              MyInputField(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(CupertinoIcons.calendar),
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Start Time",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: Icon(
                          CupertinoIcons.time,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 11),
                  Expanded(
                    child: MyInputField(
                      title: "End Time",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: Icon(
                          CupertinoIcons.time,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MyInputField(
                title: "Type",
                hint: "$_selectedType",
                widget: DropdownButton(
                  icon: Icon(
                    CupertinoIcons.down_arrow,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: SubtitleStyle,
                  underline: Container(height: 0),
                  items: typelist.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedType = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              _buildStepper(),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPalette(),
                  MyButton(label: "    Add", onTap: _validateData),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Stepper(
      steps: [
        Step(
          title: Text("Add Session"),
          content: Column(
            children: [
              MyInputField(
                title: "Name",
                hint: "Enter session name",
                controller: _sessionNameController,
              ),
              MyInputField(
                title: "Number",
                hint: "Enter session number",
                controller: _sessionNumberController,
              ),
            ],
          ),
          isActive: _currentStep == 0,
        ),
        Step(
          title: Text("Add Formateur"),
          content: Column(
            children: [
              MyInputField(
                title: "Name",
                hint: "Enter formateur name",
                controller: _formateurNameController,
              ),
              MyInputField(
                title: "Email",
                hint: "Enter formateur email",
                controller: _formateurEmailController,
              ),
            ],
          ),
          isActive: _currentStep == 1,
        ),
      ],
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep < 1) {
          setState(() {
            _currentStep += 1;
          });
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() {
            _currentStep -= 1;
          });
        } else {
          Get.back();
        }
      },
    );
  }

  _validateData() {
    if (_nameController.text.isNotEmpty && _placeController.text.isNotEmpty) {
      _addEventToDb();
      Get.snackbar(
        "Success",
        "Event added successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Required",
        "All fields are required!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: Icon(CupertinoIcons.rectangle_fill, color: Colors.red),
      );
    }
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    if (pickedTime != null) {
      String _formattedTime = pickedTime.format(context);
      if (isStartTime) {
        setState(() {
          _startTime = _formattedTime;
        });
      } else {
        setState(() {
          _endTime = _formattedTime;
        });
      }
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }

  _addEventToDb() async {
    Notifications newEvent = Notifications(
      name: _nameController.text,
      place: _placeController.text,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      color: _selectedColor,
      isCompleted: 0,
      type: _selectedType,
      namedept: _selectedDepartment,
    );

    if (_sessionNameController.text.isNotEmpty && _sessionNumberController.text.isNotEmpty) {
      Session session = Session(
        name: _sessionNameController.text,
        number: _sessionNumberController.text,
      );
      newEvent.addSession(session);
    }

    if (_formateurNameController.text.isNotEmpty && _formateurEmailController.text.isNotEmpty) {
      Formateur formateur = Formateur(
        name: _formateurNameController.text,
        email: _formateurEmailController.text,
      );
      newEvent.addFormateur(formateur);
    }

    int id = await DatabaseService.instance.addEvent(newEvent);
    print("Event added with ID: $id");

    Get.find<NotificationController>().fetchEvents();
  }

  _colorPalette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: titleStyle,
        ),
        SizedBox(height: 8.0),
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0 ? primaryClr : index == 1 ? Color(0xFF9BBBFC) : Color(0xFFF9CE69),
                  child: _selectedColor == index
                      ? Icon(
                    CupertinoIcons.check_mark,
                    color: Colors.white,
                    size: 16,
                  )
                      : Container(),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
