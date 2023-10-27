import 'package:flutter/material.dart';

Widget costomtextFormField(
    {required String hintText,
    required String valiidatorTxt,
    required TextEditingController controller,
    required dynamic maxmumLength,
    required TextInputType keyboardType}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      keyboardType: keyboardType,
      maxLength: maxmumLength,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.red)),
        fillColor: Colors.transparent,
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return valiidatorTxt;
        }
        return null;
      },
    ),
  );
}
