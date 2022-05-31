import 'package:assisto/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AssistoTextField extends StatefulWidget {
  TextEditingController controller;
  final String hintText;
  bool obscureText;
  bool viewButton;
  Widget? prefixIcon;

  AssistoTextField({
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    this.viewButton = false,
    this.prefixIcon,
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
        prefixIconColor: Theme_.aBlue,
        prefixIcon: SizedBox(
          child: Center(child: widget.prefixIcon ?? SizedBox()),
          height: 25,
          width: 25,
        ),
        filled: true,
        hintText: widget.hintText,
        fillColor: Colors.white,
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
      style: TextStyle(
        fontSize: 15,
        color: Theme_.aBlue,
      ),
    );
  }
}
