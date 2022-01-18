import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_sharedpreferencees/constants.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;

  const SearchBar({Key? key, this.controller, this.hintText, this.prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      height: 55,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Constants.secondaryColor.withOpacity(0.4),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Constants.primaryColor,
            ),
            borderRadius: BorderRadius.circular(40,),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Constants.secondaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Constants.primaryColor,
            ),
            borderRadius: BorderRadius.circular(40,),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Constants.secondaryColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Constants.primaryColor,
            ),
            borderRadius: BorderRadius.circular(40,),
          ),
        ),
      ),
    );
  }
}