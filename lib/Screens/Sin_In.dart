import 'package:chatapp/Screens/Chat_app.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chatapp/Widgets/My_Buttom.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SinIn extends StatefulWidget {
  static const String SinInroute="SinInroute";
  @override
  _SinInState createState() => _SinInState();
}

class _SinInState extends State<SinIn> {
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
              //MyTextFied(title: "Enter your Email",),
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
             // MyTextFied(title: "Enter password",),
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
              MyButtom(color: Colors.orangeAccent, title: "Sin In", onpresed: ()async{
                    setState(() {
                      spinner=true;
                    });
                try{
                  final olduser=await _auth.signInWithEmailAndPassword(email: email, password: password);

                  if (olduser!=null){
                    Navigator.pushNamed(context, ChatApp.ChatApproute);
                    setState(() {
                      spinner=false;
                    });
                  }

                }catch(e){print (e);}

              }, colortext: Colors.blue[800],)
            ],
          ),
        ),
      ),
    );;
  }
}
