import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/component/language_dailog.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:myproject/signin/Sign_page.dart';
import 'package:myproject/signin/cubit/sign_in_cubit.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitCubit, CubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<CubitCubit>();
   
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onSelectLanguage(context, cubit);
                      },
                      child: Container(
                        height: 80,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.language,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              LocaleKeys.changeLanguage
                                  .tr(), // <-- here is make change language
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            body: Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Form(
                  key: cubit.formkey,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              LocaleKeys.login
                                  .tr(), // <---here is to make change lagguage
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: cubit.UserNameControllerr,
                            decoration: InputDecoration(
                                hintText: LocaleKeys.userName.tr(),
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                         
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: cubit.PasswordeControllerr,
                            
                            decoration: InputDecoration(
                              hintText: LocaleKeys.password.tr(),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (email) {},
                          ),
                          Padding(
                            padding: EdgeInsets.all(1),
                            child: GestureDetector(
                              onTap: () {
                                cubit.onChangedRemember();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    //  side: BorderSide(color: ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    //  fillColor: MaterialStatePropertyAll(AppColor.primary),
                                    value: state.rememberme,
                                    onChanged: (bool? value) {
                                      cubit.onChangedRemember();
                                    },
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child:
                                          Text(LocaleKeys.forgotPassword.tr()))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(200, 48)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                cubit.Login(context);
                              },
                              child: Text(
                                LocaleKeys.login.tr(),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(LocaleKeys.noAccount.tr()),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return BlocProvider(
                                          create: (context) => SignInCubit(),
                                          child: SignIn_Page(),
                                        );
                                      }));
                                    },
                                    child: Text(LocaleKeys.signin.tr()))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ));
      },
    );
  }

  onSelectLanguage(BuildContext context, CubitCubit cubit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: AlertLanguage(
          //------- here is mean onLanguageChange to get the value from cubit.onChangedLanguage--------//
          onLanguageChange: (value) => cubit.onChangedLanguage(value),
        ),
      ),
    );
  }
}
