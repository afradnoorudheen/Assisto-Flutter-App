import 'package:assisto/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AssistoTextField extends StatefulWidget {
  TextEditingController controller;
  final String hintText;
  bool obscureText;
  bool viewButton;

  AssistoTextField({
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    this.viewButton = false,
  });
  @override
  _AssistoTextFieldState createState() => _AssistoTextFieldState();
}

class _AssistoTextFieldState extends State<AssistoTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
          borderSide: BorderSide(color: Theme_.aBlue, width: 10),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        suffixIcon: widget.viewButton
            ? IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
              )
            : null,
      ),
      style: TextStyle(fontSize: 15),
    );
  }
}
