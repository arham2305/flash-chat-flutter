import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton({this.title , this.colours , @required this.onPressed});
  final Color colours;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colours,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white) ,
          ),
        ),
      ),
    );
  }
}
