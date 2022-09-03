import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Column(
           children: [
             FutureBuilder<QuerySnapshot>(
               future:users.where("uid",isEqualTo:FirebaseAuth.instance.currentUser!.uid).get() ,
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                 if (snapshot.hasError) {
                   return Text("Something went wrong");
                 }
                 if (snapshot.connectionState == ConnectionState.done){
                   Map<String,dynamic> date=snapshot.data!.docs.first.data() as Map<String,dynamic>;
                   return Image.network(date["image"]);
                 }
                 return CircularProgressIndicator();
                 },
             ),
             GestureDetector(
               onTap: ()async{
                 await FirebaseAuth.instance.signOut();

               },
               child: Text("log out"),
             )
           ],
         ),
       ),
    );
  }
}
