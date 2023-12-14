import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_project/common/FormSubmissionStatus.dart';
import 'package:salty_project/ui/login/bloc/LoginBloc.dart';
import 'package:salty_project/ui/login/bloc/LoginState.dart';

import '../login/bloc/LoginEvent.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, required this.formKey}) : super(key: key);

  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state){
        return state.formStatus is FormSubmitting
            ? const Center(child: CircularProgressIndicator())
        : ElevatedButton(
            onPressed: (){
          // if(formKey.currentState!.validate()){
            context.read<LoginBloc>().add(LoginSubmitted());
          // }
        },
            child: const Text("Login"));
      }
    );
  }
}
