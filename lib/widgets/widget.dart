import 'package:chat_app_tutorial/services/database.dart';
import 'package:chat_app_tutorial/views/chatRooms_screen.dart';
import 'package:flutter/material.dart';

DatabaseMethods databaseMethods = new DatabaseMethods();

Widget appBarMain(BuildContext context){
  return AppBar(
    title: Image.asset("assets/images/logo.png", height:50,),
  );
}

/*Widget appBarChat(BuildContext context){
  return AppBar(
    title: databaseMethods.getChatUserName(userName),
  ); //AppBar
}*/

InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.white54,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color:Colors.white),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      )
  );
}

TextStyle simpleTextStyle(){
  return TextStyle(
    color:Colors.white,
    //fontSize: 16,
  );
}

TextStyle mediumTextStyle(){
  return TextStyle(
    color:Colors.white,
    fontSize: 17,
  );
}