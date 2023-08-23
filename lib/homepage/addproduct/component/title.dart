import 'package:flutter/material.dart';

class TextMess extends StatelessWidget {
  const TextMess({super.key, required this.texts});
  final String texts;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              texts,
            ),
          ),
        ],
      ),
    );
  }
}