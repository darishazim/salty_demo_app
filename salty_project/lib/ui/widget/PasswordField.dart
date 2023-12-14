import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_project/ui/login/bloc/LoginBloc.dart';
import 'package:salty_project/ui/login/bloc/LoginState.dart';

import '../login/bloc/LoginEvent.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state){
          child: return TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                icon: Icon(Icons.lock_outline),
                hintText: "password"
            ),
            validator: (value) => state.isValidPassword ? null : "Password Not Valid",
            onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(password: value)),
          );
        }
    );
  }
}
