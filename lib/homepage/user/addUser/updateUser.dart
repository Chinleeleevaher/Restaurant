// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myproject/homepage/user/addUser/cubit/user_cubit.dart';
import 'package:myproject/homepage/user/getuser/getuserprovider.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  //final _formKey = GlobalKey<FormState>();

  File? image;
  bool _obscureText = true;

  Future pickimage({required UserCubit cubit}) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      // ignore: non_constant_identifier_names
      final ImageTemporary = File(image.path);

      setState(() => this.image = ImageTemporary);
      cubit.onTypeSelectimage(ImageTemporary);
      // ignore: empty_catches
    } on PlatformException {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubits = context.read<UserCubit>();
        var provide = context.read<getUserProvider>();
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Update User',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: SizedBox(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: cubits.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // Handle picture add action
                        },
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey[200],
                              child: state.addImage != null &&
                                      state.addImage!.path.isNotEmpty
                                  ? ClipOval(
                                      child: Image.file(
                                        state.addImage!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : state.updateImage != null
                                      ? ClipOval(
                                          child: Image.network(
                                            state.updateImage!,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : const Icon(
                                          Icons.person,
                                          size: 50,
                                          color: Colors.red,
                                        ),
                            ),
                            GestureDetector(
                              onTap: () {
                                pickimage(cubit: cubits);
                              },
                              child: const CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: cubits.username,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: cubits.email,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.red,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: cubits.password,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              color: Colors.red,
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: cubits.phone,
                            keyboardType: TextInputType
                                .phone, // Sets the keyboard to show phone pad
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter
                                  .digitsOnly // Allow only digits
                            ],
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(
                                Icons.phone,
                                color: Colors.red,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a phone number';
                              }
                              return null;
                            },
                          )),
                      const SizedBox(height: 8),
                      //Text('${state.gender}'),
                      SizedBox(
                        height: 60,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Gender',
                            border: OutlineInputBorder(),
                          ),
                          value: state.gender,
                          items: ['Male', 'Female']
                              .map((gender) => DropdownMenuItem<String>(
                                    value: gender,
                                    child: Text(gender),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            //cubits.gender = value;
                            cubits.onTypeSelectGender(value);
                          },
                          validator: (value) =>
                              value == null ? 'Please select a gender' : null,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: cubits.address,
                          decoration: const InputDecoration(
                            labelText: 'Address',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(
                              Icons.home,
                              color: Colors.red,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Role',
                            border: OutlineInputBorder(),
                          ),
                          value: state.staff,
                          items: ['Admin', 'Chefs', 'Waiter']
                              .map((role) => DropdownMenuItem<String>(
                                    value: role,
                                    child: Text(role),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            //  cubits.selectedRole = value;
                            cubits.onTypeSelectRole(value);
                          },
                          validator: (value) =>
                              value == null ? 'Please select a role' : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (cubits.formKey.currentState!.validate()) {
                cubits.updateUser();
              }
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.green,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }
}
