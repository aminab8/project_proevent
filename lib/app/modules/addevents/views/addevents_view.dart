
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:proevent_project/app/modules/choose_page/views/choose_page_view.dart';
import 'package:proevent_project/app/modules/inforamtionadmin/views/inforamtionadmin_view.dart';
import 'package:proevent_project/app/modules/settings/views/settings_view.dart';

import '../controllers/addevents_controller.dart';

class AddeventsView extends GetView<AddeventsController> {
  AddeventsView({Key? key}) : super(key: key);
  final  AddeventsController controller = Get.put(AddeventsController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: controller.eventNameController,
                        decoration: InputDecoration(
                          labelText: 'nom event',
                          hintText: 'entrer le nom d event',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return " tu dois compléter ce texte";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: controller.deptController,
                        decoration: InputDecoration(
                          labelText: 'nom departement / ensemble d entreprise ',
                          hintText: 'entrer le nom d departement',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return " tu dois compléter ce texte";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Obx(() => DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(value: 'Conferences', child: Text("Conférences")),
                            DropdownMenuItem(value: 'Reunions', child: Text("Réunions")),
                            DropdownMenuItem(value: 'Seminaires', child: Text("Séminaires")),
                            DropdownMenuItem(value: 'Soires de gala', child: Text("Soirés de gala")),
                          ],
                          decoration: InputDecoration(border: OutlineInputBorder()),
                          value: controller.selectedTypeEvents.value,
                          onChanged: (value) {
                            controller.selectedTypeEvents.value = value!;
                          },
                        )),
                      ),
                      DateTimeFormField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          errorStyle: TextStyle(color: Colors.red),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note),
                          labelText: 'Enter Date',
                        ),
                        mode: DateTimeFieldPickerMode.dateAndTime,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1 ? 'please not the first day' : null,
                        onChanged: (DateTime? value) {
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.onSubmit(context),
                          child: Text("Envoyer"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offAll(ChoosePageView());
              break;
            case 1:
              Get.offAll(InforamtionadminView(password: '', email: ''));
              break;
            case 2:
              Get.offAll(SettingsView());
              break;
          }
        },
      ),
    );
  }
}
