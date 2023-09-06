
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key, this.title, this.icon, this.onPressed});
  final String? title;
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ??
              Icon(
                Icons.wifi_off,
                size: 70,
                color: Colors.red,
              ),
        ],
      ),
    );
  }
}