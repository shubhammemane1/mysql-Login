import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String? text;
  final Icon? icon;
  final TextEditingController? textEditingController;
  bool? obscure;
  final bool? suffix;

  MyTextField({
    this.text,
    this.icon,
    this.textEditingController,
    this.obscure,
    this.suffix,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: TextField(
        controller: widget.textEditingController,
        // obscureText: widget.obscure == true ? false : true,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          hintText: widget.text,
          prefixIcon: widget.icon,
          suffixIcon: widget.suffix == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.obscure == true
                          ? widget.obscure = false
                          : widget.obscure = true;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
