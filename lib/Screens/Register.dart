import 'package:chatapp/Screens/Chat_app.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chatapp/Widgets/My_Buttom.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Register extends StatefulWidget {
  static const String Registerroute="Registerroute";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth=FirebaseAuth.instance;
  String email;
   String password;
   bool spinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                child: Image.asset('images/857418.png'),
              ),
              SizedBox(
                height: 40,
              ),
             // MyTextFied(title: "Enter your Email",val:  email,),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (vale){
                  email =vale;
                },
                decoration: InputDecoration(
                    hintText: "Enter your email",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue[800],
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                        width: 1,

                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),

                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //MyTextFied(title: "Enter password",val :password),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (vale){
                  password =vale;
                },
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue[800],
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                        width: 1,

                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),

                    )
                ),
              ),
              SizedBox(height: 20,),
              MyButtom(color: Colors.blue[800], title: "Register", onpresed: ()async{
                setState(() {
                  spinner=true;
                });
                print (email);
                print (password);
            // final newuser= await _auth.createUserWithEmailAndPassword(email: email, password: password);
             try{
               final newuser= await _auth.createUserWithEmailAndPassword(email: email, password: password);

             }
             catch(e){

              // print (e);
             }
                setState(() {
                  spinner=false;
                });
                Navigator.pushNamed(context, ChatApp.ChatApproute);
              }, colortext: Colors.orangeAccent),
            ],
          ),
        ),
      ),
    );
  }
}


