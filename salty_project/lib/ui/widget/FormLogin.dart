import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/FormSubmissionStatus.dart';
import '../login/bloc/LoginBloc.dart';
import '../login/bloc/LoginEvent.dart';
import '../login/bloc/LoginState.dart';
import 'EmailField.dart';
import 'LoginButton.dart';
import 'PasswordField.dart';

class FormLogin extends StatelessWidget {
  FormLogin({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(child: Column(
            key: _formKey,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              EmailField(),
              PasswordField(),
              const SizedBox(height: 20),
              LoginButton(formKey: _formKey)
            ],
          ));
        });
  }
}
