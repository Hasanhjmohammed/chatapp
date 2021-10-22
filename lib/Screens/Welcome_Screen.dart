import 'package:chatapp/Screens/Register.dart';
import 'package:chatapp/Screens/Sin_In.dart';
import 'package:chatapp/Widgets/My_Buttom.dart';
import 'package:flutter/material.dart';

class WelcomScreen extends StatelessWidget {
  static const String welcomroute="welcomroute";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  child: Image.asset("images/857418.png"),
                ),
                Text("Chat App",style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: 40
                ),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MyButtom(
                color: Colors.orangeAccent, title: "Sing In", onpresed: () {
                  Navigator.pushNamed(context, SinIn.SinInroute);
            },colortext: Colors.blue[800],),
            SizedBox(
              height: 20,
            ),
            MyButtom(color: Colors.blue[800], title: "Register", onpresed: () {
              Navigator.pushNamed(context, Register.Registerroute);
            },colortext: Colors.orangeAccent,),
          ],
        ),
      ),
    );
  }
}
