// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';

class TextFeildss extends StatelessWidget {
  const TextFeildss({super.key, required this.hintext, required this.controller, required this.enable
  });
  final String hintext;
  final controller;
  final enable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        enabled: enable,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: hintext),
      ),
    );
  }
}
