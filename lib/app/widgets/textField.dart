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
        prefixIcon: SizedBox(
          child: widget.prefixIcon,
          height: 25,
          width: 25,
        ),
        filled: true,
        hintText: widget.hintText,
        hintStyle: Theme_.ts5rGreyL,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
          borderSide: BorderSide(color: Theme_.aBlue, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
          borderSide: BorderSide(color: Colors.white, width: 0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
      style: Theme_.ts5rBlue,
    );
  }
}
