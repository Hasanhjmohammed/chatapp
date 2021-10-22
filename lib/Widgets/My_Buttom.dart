import 'package:flutter/material.dart';
class MyButtom extends StatelessWidget {
  final Color color;
  final Color colortext;
  final String title;
  final Function onpresed;

  const MyButtom({@required this.color, @required this.title, @required this.onpresed, @required this.colortext}) ;
  @override
  Widget build(BuildContext context) {
    return Material(

      color: color,
      elevation: 4,
    borderRadius: BorderRadius.circular(25),
      child: MaterialButton(
        height: 60,
        onPressed: onpresed,
        child: Text(title,
        style: TextStyle(
          color: colortext
        ),
          ),
      ),
    );
  }
}
