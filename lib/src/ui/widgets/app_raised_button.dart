import 'package:flutter/material.dart';

class AppRaisedButton extends StatelessWidget {
  const AppRaisedButton({
    Key key,
    @required this.onPressed,
    @required this.labelText,
  }) : super(key: key);

  final String labelText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Color(0XFFFF6D65),
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8.0),
          Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }
}
