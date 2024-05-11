import 'package:get/get.dart';

class Users{
  final String email ;
  final String name;
  var isSelected= false.obs;
  Users({ required this.name,required this.email , required this.isSelected});
}