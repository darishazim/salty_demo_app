import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_project/common/FormSubmissionStatus.dart';
import 'package:salty_project/repository/LoginRepository.dart';
import 'package:salty_project/ui/home/HomePageScreen.dart';
import 'package:salty_project/ui/login/bloc/LoginBloc.dart';
import 'package:salty_project/ui/login/bloc/LoginState.dart';
import 'package:salty_project/ui/widget/EmailField.dart';
import 'package:salty_project/ui/widget/FormLogin.dart';
import 'package:salty_project/ui/widget/LoginButton.dart';
import 'package:salty_project/ui/widget/PasswordField.dart';
import 'package:salty_project/ui/widget/ShowSnackbar.dart';

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => LoginBloc(loginRepo: context.read<LoginRepository>()),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) => previous.formStatus != current.formStatus,
          listener: (context, state){
            final formStatus = state.formStatus;

            if(formStatus is SubmissionFailed){
              showSnackBar(context, formStatus.exception.toString());
            }

            if(formStatus is SubmissionSuccess){
              showSnackBar(context, formStatus.response);
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePageScreen()));
            }

          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormLogin()
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}

