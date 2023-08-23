import 'package:flutter/material.dart';

class TextFeilds extends StatelessWidget {
  const TextFeilds({super.key, required this.hintext, required this.controller
  });
  final String hintext;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: hintext),
      ),
    );
  }
}
