import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
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
            ),
            body: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Form(
                  key: cubit.formkey,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: cubit.UserNameControllerr,
                            decoration: const InputDecoration(
                                hintText: 'Username',
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // TextFormField(
                          //   controller: cubit.EmailControllerr,
                          //   validator: MultiValidator([
                          //     RequiredValidator(errorText: 'email requir'),
                          //     EmailValidator(
                          //         errorText: 'enter correct email form')
                          //   ]),
                          //   decoration: const InputDecoration(
                          //     hintText: 'Email',
                          //     border: OutlineInputBorder(),
                          //   ),
                          //   keyboardType: TextInputType.emailAddress,
                          //   onSaved: (email) {},
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: cubit.PasswordeControllerr,
                            // validator: MultiValidator([
                            //   RequiredValidator(errorText: 'password requir'),
                            //   EmailValidator(
                            //       errorText: 'enter correct password form')
                            // ]),
                            decoration: const InputDecoration(
                              hintText: 'password',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (email) {},
                          ),
                          Padding(
                            padding: EdgeInsets.all(1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text('for get passwor'))
                              ],
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
                              child: Text('Login')),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('No account'),
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
                                    child: const Text('Signin'))
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
}
