import 'package:flutter/material.dart';
import 'package:movies_project/models/movie.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, required this.controller, required this.function}) : super(key: key);
  final TextEditingController controller;
  final ValueChanged<String> function;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: widget.controller,
        decoration: const InputDecoration(
          errorStyle: TextStyle(
            fontSize: 11.0,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffA8A7A7)),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff3065AC), width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          hintText: 'Αναζήτηση',
        ),
        onSubmitted: widget.function,
      ),
    );
  }
}
