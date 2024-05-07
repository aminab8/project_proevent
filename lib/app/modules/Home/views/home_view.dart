import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);
  List catNames= [
    "Galerie",
    "Video",
    "Document",
  ];
   final List<Color> catColors = [
     Color(0xFFF9CE69),
     Colors.deepPurple,
     Color(0xFF9BBBFC),

   ];
  List<Icon> catIcons = [
    Icon(CupertinoIcons.photo_fill,color:Colors.white,size: 30,),
    Icon(CupertinoIcons.videocam_circle_fill,color: Colors.white, size: 30,),
    Icon(CupertinoIcons.doc_text,color: Colors.white,size: 30,),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 15),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child:Container(
              margin: EdgeInsets.only(top: 5,bottom: 20),
              width: MediaQuery.of(context).size.width,
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search here ....",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20,left: 15,right: 15),
            child: Column(
              children: [
                GridView.builder(
          itemCount: catNames.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),

    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 3,childAspectRatio: 1.1,),
                    itemBuilder:(context ,index){
            return Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: catColors[index],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: catIcons[index],
                  ),
                ),
                SizedBox(height: 10,),
                Text(catNames[index],
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black,
                  ),
                ),
              ],
            );
                    }
                ),

              ],
            ),
          ),
          Lottie.asset('assets/animation/home_page.json',
         height: 300,
          repeat: true,
           reverse: true,
         fit: BoxFit.cover,
    ),

        ],
      ),
    );
  }}
