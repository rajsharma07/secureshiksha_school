import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/login/login_bloc.dart';
import 'package:secureshiksha_school/bloc/login/login_event.dart';
import 'package:secureshiksha_school/bloc/login/login_sate.dart';
import 'package:secureshiksha_school/core/error_widgets/my_snack_bar.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formkey = GlobalKey<FormState>();
  String id = "";
  String password = "";

  void login() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      context.read<LoginBloc>().add(
            Login(
              id: id,
              password: password,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("School Id"),
                  ),
                  validator: (value) {
                    if (value == null || value.trim() == "") {
                      return "Enter valid ID";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    id = newValue!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Password"),
                  ),
                  validator: (value) {
                    if (value == null || value.trim() == "") {
                      return "Enter valid Email";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    password = newValue!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is FailureState) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (timeStamp) {
                          MySnackBar.showSnackBar(
                              ctx: context, message: state.message);
                        },
                      );

                      return ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          child: const Text("Login"));
                    } else {
                      return ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          child: const Text("Login"));
                    }
                  },
                )
              ],
            )));
  }
}
