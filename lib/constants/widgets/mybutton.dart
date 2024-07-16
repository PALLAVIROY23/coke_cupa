
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget button(String text,Color color , {Color? textcolor,}){
  return  Container(
      height: Get.height*0.05,
      width: Get.width*0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child:  Center(child: Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color:textcolor))));
}

Widget myButton({String ?text,void Function()? onTap,Color? Color,Color? textcolor}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: Get.height * 0.04,
      width: Get.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text==null?SizedBox():          Text(
            text,
            style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: textcolor),
          ),
        ],
      ),
    ),
  );
}

