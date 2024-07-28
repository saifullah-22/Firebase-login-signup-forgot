import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vs_firebase_new/screens/forgot.dart';
import 'package:flutter_vs_firebase_new/screens/signup.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();

  signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Enter Email"
              ),
            ),

            SizedBox(
                height: 40,
              ),
        
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Enter Password"
              ),
            ),

            SizedBox(
                height: 30,
              ),

            ElevatedButton(
              onPressed: (){
                signIn();
              }, 
              child: Text("Login")),

              SizedBox(
                height: 30,
              ),

              ElevatedButton(
              onPressed: (){
                Get.to(Signup());
              }, 
              child: Text("Register Now")),

              SizedBox(
                height: 30,
              ),

              ElevatedButton(
              onPressed: (){
                Get.to(Forgot());
              }, 
              child: Text("Forgot Password"))
          ],
        ),
      ),
    );
  }
}