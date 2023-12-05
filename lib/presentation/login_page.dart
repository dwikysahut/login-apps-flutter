// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_apps/model/auth/login_response.dart';
import 'package:login_apps/model/auth/login_request.dart';
import 'package:login_apps/repository/auth_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool _isHidden;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late Dio _dio;
  late bool _validate;
  final _formKey = GlobalKey<FormState>();
  AuthRepository _authRepository = AuthRepository();

  @override
  void initState() {
    _isHidden = true;
    _dio = Dio();
    _validate = false;
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  Future<dynamic> loginHandler(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _authRepository.signInUser(
            LoginRequest(
                email: _usernameController.text,
                password: _passwordController.text),
            context);
        await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Yeay.."),
                  content: Text("Login berhasil.."),
                ));
        Future.delayed(
            Durations.short1, () => {Navigator.pushNamed(context, '/home')});

        // Navi
      } on Exception catch (e) {
        print(e);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Oops.."),
                  content: Text(e.toString()),
                ));
      }
      // dioResponse = await _dio.get("https://reqres.in/api/users?page=2");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 36),
        width: double.infinity,
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Selamat Datang . .",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username harus diisi';
                      }
                      if (value.length < 3) {
                        return 'Username minimal 3 karakter';
                      }
                      return null;
                    },
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_2_outlined),
                        // errorText:
                        //     _validate ? 'Value Can\'t Be Empty' : null, //here
                        hintText: "Username")),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password harus diisi';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            },
                            child: _isHidden
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        hintText: "Password")),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont Have an Account ? ",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                    ),
                    Text(
                      "Register Here",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Color.fromARGB(255, 3, 36, 86)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      loginHandler(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ]),
        ),
      )),
    );
  }
}
