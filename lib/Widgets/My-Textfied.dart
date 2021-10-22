import 'package:flutter/material.dart';

class MyTextFied extends StatelessWidget {
  final String title;
   String val;

   MyTextFied({ @required this.title, @ required this.val}) ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      onChanged: (vale){
        val =vale;
      },
      decoration: InputDecoration(
          hintText: title,
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
    );
  }
}