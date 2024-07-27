import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//await Future.delayed(const Duration(seconds: 1));
class MyProgress {
  Future loadingProgress(
      {required BuildContext context, String? title, bool? canPop}) async {
    return showDialog(
      context: context,
      barrierDismissible: canPop ?? false,
      builder: (context) {
        return SimpleDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          children: [
            Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Platform.isIOS
                            ? const CupertinoActivityIndicator()
                            : const CircularProgressIndicator(),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        title ?? 'Loading...',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}