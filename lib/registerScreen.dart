import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_chat/firebase/auth.dart';
import 'package:my_chat/firebase/cloudstorage.dart';
import 'package:my_chat/profile.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController adresssController = TextEditingController();
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'register',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'first name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'lastname',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: adresssController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'adrss',
                  ),
                ),
              ),



              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),

              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('register'),
                    onPressed: ()async {
                      String res=await Auth().register(emailController.text, passwordController.text,firstNameController.text,lastNameController.text,adresssController.text,this.imageFile);
                      if (res=="done"){
                        print("user created done");
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return ProfileScreen();}));
                      }
                      else{
                        print(res);
                      }
                    },
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('upload image'),
                    onPressed: ()async {
                      this.imageFile=await uploadImage();
                    },
                  )
              ),

            ],
          )),
    );
  }
}