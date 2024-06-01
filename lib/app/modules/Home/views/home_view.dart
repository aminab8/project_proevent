import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../component/textutils.dart';
import '../../SendFeedback/views/send_feedback_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 20),
              width: MediaQuery.of(context).size.width,
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Recherche old event ...",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    size: 25,
                  ),
                ),
                onFieldSubmitted: (value) {
                  controller.performSearch(value);
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Obx(
                  () {
                if (controller.eventList.isEmpty) {
                  return Center(child: Text('No events found'));
                } else {
                  return GridView.builder(
                    itemCount: controller.eventList.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 9.0,
                      crossAxisSpacing: 6,
                      maxCrossAxisExtent: 200,
                    ),
                    itemBuilder: (context, index) {
                      var event = controller.eventList[index];
                      return BuildCardItems(
                        image: event.image,
                        rate: event.rate,
                        eventId: event.id,
                        name: event.name,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildCardItems({
    required String image,
    required double rate,
    required eventId,
    required String name,
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
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.square_favorites,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
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
              GestureDetector(
                onTap: () {
                  Get.to(() =>SendFeedbackView());
                },
                child: Container(
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
                      Icon(
                        CupertinoIcons.star,
                        size: 11,
                        color: Colors.white,
                      ),
                      ],
                    ),
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
}
