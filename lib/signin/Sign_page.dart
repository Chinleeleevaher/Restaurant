// ignore_for_file: camel_case_types, file_names, unrelated_type_equality_checks

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:myproject/signin/cubit/sign_in_cubit.dart';

class SignIn_Page extends StatefulWidget {
  const SignIn_Page({super.key});

  @override
  State<SignIn_Page> createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status == liststatuse.loading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        //this below code is to access to read SignInCubit page
        var signCubit = context.read<SignInCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.signin.tr()),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Form(
                    key: signCubit.formkey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Icon(
                          Icons.person,
                          color: Colors.red,
                          size: 40,
                        ),
                        Text(
                          LocaleKeys.signin.tr(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: signCubit.UserNameControllerr,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.userName.tr(),
                            border: const OutlineInputBorder(),
                            suffixIcon: const Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: signCubit.EmailControllerr,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.userNameOrEmail.tr(),
                            border: const OutlineInputBorder(),
                            suffixIcon: const Icon(Icons.email_sharp),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: signCubit.PasswordeControllerr,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.password.tr(),
                            border: const OutlineInputBorder(),
                            suffixIcon: const Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              minimumSize: WidgetStateProperty.all<Size>(
                                  const Size(200, 48)),
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                            ),
                            onPressed: () {
                              signCubit.creatUser(context);
                            },
                            child: Text(LocaleKeys.signin.tr()))
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
