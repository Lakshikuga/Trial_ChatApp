import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseMethods{

  getUserByUsername(String username) async {
    return await Firestore.instance.collection("users").
    where("name", isEqualTo: username).getDocuments();
  }

  getUserByEmail(String userEmail) async{
    return await Firestore.instance.collection("users")
    .where("email", isEqualTo: userEmail).getDocuments();
  }

  uploadUserInfo(userMap){
    Firestore.instance.collection("users").add(userMap).catchError((e){
      print(e.toString());
    });
  }

  createChatRoom(String chatRoomId, chatRoomMap){
    Firestore.instance.collection("ChatRoom")
        .document(chatRoomId).setData(chatRoomMap).catchError((e){
          print(e.toString());
    });

  }

  addConversationMessages(String chatRoomId, messageMap){
    Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .collection("Chats")
        .add(messageMap).catchError((e){
          print(e.toString());
    });
    
  }

  getConversationMessages(String chatRoomId) async {
    return await Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .collection("Chats")
        .orderBy("time", descending: false)
        .snapshots(); //we want a stream of snapshots not just the documents.
  }

  getChatRooms(String userName) async {
    return await Firestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userName)
    .snapshots();   //you can use getDocuments() but we want the chats to be available, therefore use snapshots()

  }
  /*getChatUserName(String userName){
    return Firestore.instance.collection("ChatRoom").where("users", arrayContains: userName);
  }*/
}