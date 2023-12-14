import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_project/ui/login/bloc/LoginBloc.dart';
import 'package:salty_project/ui/login/bloc/LoginState.dart';

import '../login/bloc/LoginEvent.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state){
        child: return TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: "email"
          ),
          validator: (value) => state.isValidEmailLenght ? null : "Email Not Valid",
          onChanged: (value) => context.read<LoginBloc>().add(LoginEmailChanged(email: value)),
        );
      }
    );
  }
}
