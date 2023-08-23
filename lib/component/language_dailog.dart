
import 'package:flutter/material.dart';
import 'package:myproject/constant/laguage.dart';

class AlertLanguage extends StatelessWidget {
  const AlertLanguage({super.key, required this.onLanguageChange});

  final Function(String) onLanguageChange; // <--  here is to send the code langauge to the login page and navbar page
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
         // Text(LocaleKeys.selectLanguage.tr()),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: AppLanguage.supportLanguages
                      .map(
                        (e) => ListTile(
                          onTap: (){
                            Navigator.pop(context);
                            onLanguageChange(e['code'].toString());
                          },
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(e['image'].toString()),
                          ),
                          title: Text(e['title'].toString()),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
