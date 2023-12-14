import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:salty_project/common/FormSubmissionStatus.dart';

class LoginState extends Equatable{

  final String email;
  bool get isValidEmailLenght => email.length > 5;
  final String password;
  bool get isValidPassword => password.length > 3;

  final FormSubmissionStatus formStatus;

  const LoginState({
    this.email = "",
    this.password = "",
    this.formStatus = const InitialFormStatus()
  });

  LoginState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formStatus
}){
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus
    );
  }


  @override
  List<Object?> get props => [email, password, formStatus];


}