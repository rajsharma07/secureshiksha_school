import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/home/changePassword/change_password_bloc.dart';
import 'package:secureshiksha_school/bloc/home/changePassword/change_password_event.dart';
import 'package:secureshiksha_school/bloc/home/changePassword/change_password_state.dart';
import 'package:secureshiksha_school/core/error_widgets/my_snack_bar.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({super.key});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(),
      child: Column(
        children: [
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              label: Text("New Password: "),
            ),
          ),
          BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
            builder: (context, state) {
              if (state is FailureState) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    MySnackBar.showSnackBar(
                        ctx: context, message: state.message);
                  },
                );
              }
              return ElevatedButton(
                onPressed: (state is Loading)
                    ? null
                    : () {
                        if (passwordController.text.trim() == "" ||
                            passwordController.text.trim().length < 6) {
                          MySnackBar.showSnackBar(
                              ctx: context,
                              message:
                                  "Enter valid password length of password should be atleast 6 characters");
                          return;
                        }
                        context.read<ChangePasswordBloc>().add(
                              ChangePassword(passwordController.text),
                            );
                      },
                child: (state is Loading)
                    ? const CircularProgressIndicator()
                    : const Text("ChangePassword"),
              );
            },
          ),
        ],
      ),
    );
  }
}
