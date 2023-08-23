import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
           Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        //this below code is to access to read SignInCubit page
        var signCubit = context.read<SignInCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sigin page'),
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
                        const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: signCubit.UserNameControllerr,
                          decoration: const InputDecoration(
                            hintText: 'UserName',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: signCubit.EmailControllerr,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.email_sharp),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: signCubit.PasswordeControllerr,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                              signCubit.creatUser(context);
                            },
                            child: const Text('Save'))
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
