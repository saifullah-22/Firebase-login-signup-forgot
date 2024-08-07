import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vs_firebase_new/wrapper.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  signUp() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            
            TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    hintText: "Enter Email",
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                                    
              
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
        
            SizedBox(
                height: 40,
              ),
        
      
            TextFormField(
              controller: password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    hintText: "Password",
                    labelText: "Password",
      
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
      
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
      
                      )
                    )
                  ),
                  
                  
                ),
      
                SizedBox(
                height: 40,
              ),
      
      
            ElevatedButton(
              onPressed: (){
                signUp();
              }, 
              child: Text("Sign Up"))
          ],
        ),
      ),
    );

  }
}