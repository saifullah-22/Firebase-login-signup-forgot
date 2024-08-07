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
        title: Text("Login Page"),
       // backgroundColor: Colors.amber,
        
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          
          
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Enter Email",
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            
      
          SizedBox(
              height: 40,
            ),
      
      
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: password,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: "Password",
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                ),
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
    );
  }
}