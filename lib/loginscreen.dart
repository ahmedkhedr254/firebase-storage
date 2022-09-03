import 'package:flutter/material.dart';
import 'package:my_chat/firebase/auth.dart';
import 'package:my_chat/profile.dart';
import 'package:my_chat/registerScreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    'login',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
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
                    child: const Text('Login'),
                    onPressed: () async{
                      String res=await Auth().login(emailController.text, passwordController.text);
                      if (res=="done"){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return ProfileScreen();}));
                      }
                      else{
                        print(res);
                      }
                    },
                  )
              ),
              SizedBox(height: 50,),
              Container(

                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),

                  child: ElevatedButton(

                    child: const Text('facebook'),
                    onPressed: () async{
                       var res=await Auth().signInWithFacebook();
                       print(res);
                    },
                  )
              ),
              SizedBox(height: 10,),
              Container(

                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),

                  child: ElevatedButton(

                    child: const Text('google'),
                    onPressed: () async{
                      await Auth().signInWithGoogle();
                    },
                  )
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){return RegisterScreen();}));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}